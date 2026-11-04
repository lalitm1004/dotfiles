pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property color pillColor: Qt.rgba(35 / 255, 31 / 255, 32 / 255, 0.88)

    readonly property color foreground: "#ffffff"

    readonly property color occupiedColor: Qt.rgba(1, 1, 1, 0.75)

    readonly property color emptyColor: Qt.rgba(1, 1, 1, 0.30)

    readonly property string fontName: "JetBrainsMono Nerd Font"
}
