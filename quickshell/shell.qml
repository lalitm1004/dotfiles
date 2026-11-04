import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import Quickshell.Services.UPower
import Quickshell.Networking

PanelWindow {
    id: bar

    anchors.top: true
    anchors.left: true
    anchors.right: true

    implicitHeight: 40
    color: "transparent"

    property color pillColor: Qt.rgba(35 / 255, 31 / 255, 32 / 255, 0.88)
    property color foreground: "#ffffff"
    property color occupiedColor: Qt.rgba(1, 1, 1, 0.75)
    property color emptyColor: Qt.rgba(1, 1, 1, 0.30)
    property string fontName: "JetBrainsMono Nerd Font"

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        spacing: 0

        // CLOCK
        Rectangle {
            Layout.alignment: Qt.AlignVCenter

            implicitHeight: 30
            implicitWidth: clockText.implicitWidth + 30

            radius: 999
            color: bar.pillColor

            Text {
                id: clockText

                anchors.centerIn: parent

                text: Qt.formatDateTime(new Date(), "HH:mm")
                color: bar.foreground

                font.family: bar.fontName
                font.pixelSize: 14
                font.weight: Font.Medium

                Timer {
                    interval: 1000
                    running: true
                    repeat: true

                    onTriggered: {
                        clockText.text =
                            Qt.formatDateTime(new Date(), "HH:mm")
                    }
                }
            }
        }

        // WORKSPACES
        Rectangle {
            Layout.leftMargin: 5
            Layout.alignment: Qt.AlignVCenter

            Layout.minimumWidth: 286
            Layout.preferredWidth: 286
            Layout.maximumWidth: 286

            implicitWidth: 286
            implicitHeight: 34

            radius: 999
            color: bar.pillColor

            Row {
                id: workspaceRow

                anchors.centerIn: parent
                spacing: 0

                Repeater {
                    model: 9

                    delegate: Item {
                        width: 30
                        height: 30

                        property int workspaceId: index + 1

                        property var ws:
                            Hyprland.workspaces.values.find(
                                w => w.id === workspaceId
                            )

                        property bool isActive:
                            Hyprland.focusedWorkspace?.id === workspaceId

                        property bool isHovered:
                            workspaceMouse.containsMouse

                            // tier 1: light circle, shown for the active workspace
Rectangle {
    anchors.centerIn: parent

    width: 26
    height: 26
    radius: 999

    color: Qt.rgba(1, 1, 1, 0.14)
    opacity: isActive ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
    }
}

// tier 2: dark circle, fades in over tier 1 on hover
Rectangle {
    anchors.centerIn: parent

    width: 26
    height: 26
    radius: 999

    color: Qt.rgba(0, 0, 0, 0.25)
    opacity: isHovered ? 1 : 0

    Behavior on opacity {
        NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
    }
}

                        // measures the visible ink of the glyph
                        TextMetrics {
                            id: glyphMetrics

                            font.family: bar.fontName
                            font.pixelSize: 16
                            text: isActive ? "󰫢" : "󰫣"
                        }

                        // glyph, positioned by its visible bounds
                        Text {
    id: glyphText

    x: (parent.width - glyphMetrics.tightBoundingRect.width) / 2
        - glyphMetrics.tightBoundingRect.x

    // use the Text's real baseline instead of the nominal font ascent
    y: (parent.height - glyphMetrics.tightBoundingRect.height) / 2
        - (glyphText.baselineOffset + glyphMetrics.tightBoundingRect.y)

    text: glyphMetrics.text

    color: (isActive || isHovered)
        ? bar.foreground
        : (ws
            ? bar.occupiedColor
            : bar.emptyColor)

    font.family: bar.fontName
    font.pixelSize: 16
}

                        MouseArea {
                            id: workspaceMouse

                            anchors.fill: parent
                            hoverEnabled: true

                            onClicked: {
                            if (Hyprland.usingLua) {
            Hyprland.dispatch(
                'hl.dsp.focus({ workspace = "' + workspaceId + '" })'
            )
        } else {
            Hyprland.dispatch("workspace " + workspaceId)
        }
                            }
                        }
                    }
                }
            }
        }

        // FLEXIBLE EMPTY SPACE
        Item {
            Layout.fillWidth: true
        }

        // NETWORK
        Rectangle {
            Layout.alignment: Qt.AlignVCenter

            implicitHeight: 30
            implicitWidth: 42

            radius: 999
            color: bar.pillColor

            property bool connected:
                Networking.devices.values.some(
                    device => device.connected
                )

            Text {
                anchors.centerIn: parent

                text: parent.connected ? "󰖩" : "󰖪"

                color: parent.connected
                    ? bar.foreground
                    : bar.emptyColor

                font.family: bar.fontName
                font.pixelSize: 17
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    Quickshell.execDetached([
                        "networkmanager_dmenu"
                    ])
                }
            }
        }

        // AUDIO
        Rectangle {
            Layout.leftMargin: 5
            Layout.alignment: Qt.AlignVCenter

            implicitHeight: 30
            implicitWidth: audioText.implicitWidth + 28

            radius: 999
            color: bar.pillColor

            Text {
                id: audioText

                anchors.centerIn: parent

                property var sink: Pipewire.defaultAudioSink

                text: {
                    if (!sink || !sink.ready || !sink.audio)
                        return "󰝟"

                    if (sink.audio.muted)
                        return "󰝟"

                    let volume = Math.round(
                        sink.audio.volume * 100
                    )

                    let icon = volume < 34
                        ? "󰕿"
                        : volume < 67
                            ? "󰖀"
                            : "󰕾"

                    return icon + " " + volume + "%"
                }

                color: sink?.audio?.muted
                    ? bar.emptyColor
                    : bar.foreground

                font.family: bar.fontName
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent

                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        Quickshell.execDetached([
                            "pamixer", "-t"
                        ])
                    } else {
                        Quickshell.execDetached([
                            "pavucontrol"
                        ])
                    }
                }
            }
        }

        // BATTERY
        Rectangle {
            Layout.leftMargin: 5
            Layout.alignment: Qt.AlignVCenter

            implicitHeight: 30
            implicitWidth: batteryText.implicitWidth + 28

            radius: 999
            color: bar.pillColor

            Text {
                id: batteryText

                anchors.centerIn: parent

                property var battery: UPower.displayDevice

                property int percentage: battery && battery.ready
                    ? Math.round(battery.percentage * 100)
                    : 100

                property string batteryIcon: {
                    if (percentage <= 10) return "󰁺"
                    if (percentage <= 20) return "󰁻"
                    if (percentage <= 30) return "󰁼"
                    if (percentage <= 40) return "󰁽"
                    if (percentage <= 50) return "󰁾"
                    if (percentage <= 60) return "󰁿"
                    if (percentage <= 70) return "󰂀"
                    if (percentage <= 80) return "󰂁"
                    if (percentage <= 90) return "󰂂"
                    return "󰁹"
                }

                text: battery && battery.ready
                    ? batteryIcon + " " + percentage + "%"
                    : "󰂑"

                color: bar.foreground

                font.family: bar.fontName
                font.pixelSize: 14
            }
        }
    }
}
