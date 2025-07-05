import QtQuick
import QtQuick.Controls 2.15

Page {
    width: 360
    height: 640
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#181c2c"

        Rectangle {
            id: rectangle
            x: 12
            y: 212
            width: 337
            height: 271
            color: "#262f51"
            radius: 40
            border.width: 0
            baselineOffset: 0

            Text {
                id: text1
                x: 38
                y: 31
                width: 80
                height: 20
                text: qsTr("Username")
                font.pixelSize: 14
            }

            Text {
                id: text2
                x: 38
                y: 126
                width: 80
                height: 20
                text: qsTr("Password")
                font.pixelSize: 14
            }

            Button {
                id: button1
                x: 203
                y: 184
                width: 96
                height: 15
                Text {
                    text: qsTr("Forgot password?")
                    anchors.verticalCenterOffset: -3
                    anchors.horizontalCenterOffset: 0
                    color: "blue"
                    anchors.centerIn: parent
                    width: 96
                    height: 17
                    font.underline: true
                }
                background: transparent
            }
        }

        BorderImage {
            id: borderImage
            x: 130
            y: 39
            width: 100
            height: 100
            source: "file:///D:/code/qt/time/time/logo.png"
        }

        Text {
            id: text3
            x: 99
            y: 128
            width: 163
            height: 78
            color: "#e4e4e4"
            text: qsTr("Log In ")
            font.pixelSize: 42
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }
    }

    Rectangle {
        x: 50
        y: 262
        width: 261
        height: 32
        color: "#181c2c"
        radius: 7
    }
    TextInput {
        id: texts
        x: 55
        y: 264
        width: 256
        height: 32
        color: "#e4e4e4"
        text: qsTr("")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        transformOrigin: Item.Right
    }

    Button {
        id: button
        x: 105
        y: 410
        width: 150
        height: 50
        background: transparent

        onClicked: {
            cppBackend.getuser(texts.text)
            cppBackend.getpass(texts1.text)
            cppBackend.loginuser()
        }
        Text{
            anchors.centerIn: parent
            text: "Log In"
            color: "#e4e4e4"
            font.bold: true
            font.pixelSize: 32

        }
    }

    Rectangle {
        x: 50
        y: 355
        width: 261
        height: 32
        color: "#181c2c"
        radius: 7
    }
    TextInput {
        id: texts1
        x: 55
        y: 357
        width: 256
        height: 32
        color: "#e4e4e4"
        text: qsTr("")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        echoMode: TextInput.Password
        transformOrigin: Item.Right
    }


    Text {
        id: warninguser
        x: 50
        y: 295
        width: 200
        height: 19
        visible: cppBackend.textVisible
        color: "#d50310"
        text: qsTr("username or password is incorrect")
        font.pixelSize: 12
        font.italic: true
        font.bold: true
    }
}
