import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 800
    visible: true
    color: "#96f0f5"
    title: qsTr("Hello World")

    TextInput {
        id: texts
        x: 220
        y: 232
        width: 200
        height: 40
        text: qsTr("user")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
    }

    Button {
        id: button
        x: 194
        y: 485
        width: 252
        height: 160
        text: qsTr("Button")
        font.bold: true
        font.pointSize: 50
        onClicked: {
            cppBackend.getuser(texts.text)
            cppBackend.getpass(texts1.text)
        }

    }

    TextInput {
        id: texts1
        x: 220
        y: 356
        width: 200
        height: 40
        text: "pass"
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        echoMode: TextInput.Password
    }

    Text {
        id: warninguser
        x: 212
        y: 264
        width: 200
        height: 50
        visible: cppBackend.textVisible
        color: "#ff0000"
        text: qsTr("enter Valid user")
        font.pixelSize: 20
        font.italic: true
        font.bold: true
    }
}
