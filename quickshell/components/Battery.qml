import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Rectangle {
    Layout.leftMargin: 5
    Layout.alignment: Qt.AlignVCenter

    implicitHeight: 30
    implicitWidth: batteryText.implicitWidth + 28

    radius: 999
    color: Theme.pillColor

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

        color: Theme.foreground

        font.family: Theme.fontName
        font.pixelSize: 14
    }
}
