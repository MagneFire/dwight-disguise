/*
 * Copyright (C) 2020 Darrel Griët <IDaNLContact@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import org.asteroid.controls 1.0
import org.nemomobile.lipstick 0.1
import Qt.labs.folderlistmodel 2.1

Item {
    property int index: 0
    FolderListModel {
        id: imageModel
        folder: "file:///usr/share/asteroid-launcher/wallpapers/dwight-disguise/"
        nameFilters: ["*.gif"]
    }

    AnimatedImage {
        id: animation
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        // Pause at last frame
        paused: currentFrame == (frameCount - 1)
        // Set source if model has loaded/isn't empty
        source: (index < imageModel.count) ? imageModel.get(index, "filePath") : ""
    }

    Connections {
        target: Lipstick.compositor
        onDisplayOn: {
            if (index < (imageModel.count - 1)) index ++
            else index = 0

            animation.currentFrame = 0            
        }
    }
}


