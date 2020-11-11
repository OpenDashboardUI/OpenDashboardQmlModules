// Copyright (C) 2020 twyleg
import QtQuick 2.0

Item {
	id: relativeItem

	property real relX: 0.5
	property real relY: 0.5
	property real relWidth: 1.0
	property real relHeight: 1.0

	width: parent.width * relWidth
	height: parent.height * relHeight

	x: parent.width * relX - width/2
	y: parent.height * relY - height/2
}
