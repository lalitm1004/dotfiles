import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.components

PanelWindow {
    anchors.top: true
    anchors.left: true
    anchors.right: true

    implicitHeight: 40
    color: "transparent"

    RowLayout {
        anchors.fill: parent
        anchors.topMargin: 4
        anchors.bottomMargin: 4
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        spacing: 0

        Clock {}
        Workspaces {}
        Item {
            Layout.fillWidth: true
        }
        Network {}
        Audio {}
        Battery {}
    }
}
