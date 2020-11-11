// Copyright (C) 2020 twyleg
import QtQuick 2.0

Image {
	id: svg

	fillMode: Image.PreserveAspectFit
	anchors.fill: parent

	smooth: true
	cache: false

	onWidthChanged: updateSourceSize()
	onHeightChanged: updateSourceSize()

	property int currentSourceWidth: 0
	property int currentSourceHeight: 0

	Timer {
		id: applySourceSizeTimer

		interval: 500
		running: false
		repeat: false
		onTriggered: applySourceSize()
	}

	function applySourceSize() {
		sourceSize = Qt.size(currentSourceWidth, currentSourceHeight)
	}

	function startApplySourceSizeTimer() {
		if (applySourceSizeTimer.running) {
			applySourceSizeTimer.restart()
		} else {
			applySourceSizeTimer.start()
		}
	}

	function updateSourceSize() {
		svg.currentSourceWidth = width
		svg.currentSourceHeight = height
		applySourceSizeTimer.restart()

	}

	Component.onCompleted: updateSourceSize()
}
