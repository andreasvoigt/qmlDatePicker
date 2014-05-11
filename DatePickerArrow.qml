import QtQuick 2.2

/*
Copyright (c) 2014, Andreas Voigt <info@voigt-webdesign.de>
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
DAMAGE.
*/

Item {
    property string arrowtype: 'leftarrow'
    property DatePickerStyle platformStyle: DatePickerStyle {}

    function paintArrow(aCanvas) {
        var lGC = aCanvas.getContext('2d'),
            lLW = 2,
            lMargin = Math.ceil(lLW / 2) + 2,
            lLowX = lMargin,
            lHighX = aCanvas.width - lMargin,
            lLowY = lMargin,
            lMidY = Math.round(aCanvas.height / 2),
            lHighY = aCanvas.height - lMargin;

        lGC.lineWidth = lLW;
        lGC.lineCap = 'round';
        lGC.strokeStlye = platformStyle.arrowColor;
        lGC.beginPath();
        if (arrowtype === 'leftarrow') {
            lGC.moveTo(lHighX, lLowY);
            lGC.lineTo(lLowX, lMidY);
            lGC.lineTo(lHighX, lHighY);
        }
        else if (arrowtype === 'rightarrow') {
            lGC.moveTo(lLowX, lLowY);
            lGC.lineTo(lHighX, lMidY);
            lGC.lineTo(lLowX, lHighY);
        }

        lGC.stroke();
    }

    Canvas {
        id: arrowCanvas
        anchors.fill: parent
        antialiasing: true

        onPaint: parent.paintArrow(this)
    }
}
