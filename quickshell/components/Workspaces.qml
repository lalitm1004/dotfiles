import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
    Layout.leftMargin: 5
    Layout.alignment: Qt.AlignVCenter

    Layout.minimumWidth: 286
    Layout.preferredWidth: 286
    Layout.maximumWidth: 286

    implicitWidth: 286
    implicitHeight: 34

    radius: 999
    color: Theme.pillColor

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

                    font.family: Theme.fontName
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
                        ? Theme.foreground
                        : (ws
                            ? Theme.occupiedColor
                            : Theme.emptyColor)

                    font.family: Theme.fontName
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
