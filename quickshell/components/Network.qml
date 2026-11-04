import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Networking

Rectangle {
    Layout.alignment: Qt.AlignVCenter

    implicitHeight: 30
    implicitWidth: networkText.implicitWidth + 28

    radius: 999
    color: Theme.pillColor

    readonly property var wifiDevice:
        Networking.devices.values.find(d => d.type === DeviceType.Wifi) ?? null

    readonly property var activeNetwork:
        wifiDevice?.networks.values.find(n => n.connected) ?? null

    readonly property bool connected:
        Networking.devices.values.some(d => d.connected)

    Text {
        id: networkText

        anchors.centerIn: parent

        text: activeNetwork
            ? "󰖩  " + activeNetwork.name
            : connected
                ? "󰈀"
                : "󰖪"

        color: connected ? Theme.foreground : Theme.emptyColor

        font.family: Theme.fontName
        font.pixelSize: 14
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            Quickshell.execDetached(["networkmanager_dmenu"])
        }
    }
}
