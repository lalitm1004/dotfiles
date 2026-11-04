import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

Rectangle {
    Layout.leftMargin: 5
    Layout.alignment: Qt.AlignVCenter

    implicitHeight: 30
    implicitWidth: audioText.implicitWidth + 28

    radius: 999
    color: Theme.pillColor

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

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
            ? Theme.emptyColor
            : Theme.foreground

        font.family: Theme.fontName
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
