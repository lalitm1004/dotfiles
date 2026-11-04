import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.alignment: Qt.AlignVCenter

    implicitHeight: 30
    implicitWidth: clockText.implicitWidth + 30

    radius: 999
    color: Theme.pillColor

    Text {
        id: clockText

        anchors.centerIn: parent

        text: Qt.formatDateTime(new Date(), "HH:mm")
        color: Theme.foreground

        font.family: Theme.fontName
        font.pixelSize: 14
        font.weight: Font.Medium

        Timer {
            interval: 1000
            running: true
            repeat: true

            onTriggered: {
                clockText.text = Qt.formatDateTime(new Date(), "HH:mm")
            }
        }
    }
}
