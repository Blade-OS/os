/* === This file is part of Calamares - <http://github.com/calamares> ===
 *
 *   Copyright 2015, Teo Mrnjavac <teo@kde.org>
 *   Copyright 2018-2019, Jonathan Carter <jcc@debian.org>
 *
 *   Calamares is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, or (at your option) any later version.
 *
 *   Calamares is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
       presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 60000
        running: true
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {
           anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            border.width: 0
            color: "#051531"
            Image {
                id: slide1
                source: "slide1.png"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
        }
    }

    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }

    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }
}
