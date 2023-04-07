/*
 * Copyright (C) 2023  Giulio Sorrentino
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * qmlfortune is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'qmlfortune.numerone'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

        AdaptivePageLayout {
        anchors.fill: parent
        primaryPage: page1
        Page {
                id: page1
        	header: PageHeader {
        	    title: 'qmldatefrom'
        	}
            Settings {
    	id: "settings"
    	property string data: "2022-12-25"
    }
    Image {
    	    id: background
            source: "../assets/Background.jpg"
            width: parent.width
            height: parent.height
    }	
    ColumnLayout{
   	   	anchors {
                	top: page1.header.bottom
                	left: parent.left
                	right: parent.right
               	 	bottom: parent.bottom
            	}
    	   width: parent.width
      	   	   height: page1.contentHeight   	   

	      Text{
	      	 id: cookie
        	 width: 175
        	 wrapMode: Text.WordWrap
        	 elide: Text.ElideLeft
	      }

	    Button {
       	    	Layout.fillWidth: true
            	text: i18n.tr('Calculate');
            	onClicked: {
        var xmlhttp = new XMLHttpRequest();
        var url = "https://api.justyy.workers.dev/api/fortune";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var data=xmlhttp.responseText
		cookie.text=data;
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8')
        xmlhttp.send();
    }

}

          Button {
      	    Layout.fillWidth: true
            text: i18n.tr("Informations")
            onClicked: page1.pageStack.addPageToCurrentColumn(page1, page2)
         }
   }
  }
    Page {
	    id: page2
            header: PageHeader {
        	    title: i18n.tr('Informations')
        }
    Image {
            source: "../assets/Background.jpg"
            width: parent.width
            height: parent.height
    }	
    ColumnLayout {
	   anchors {
           	top: page2.header.bottom
           	left: parent.left
           	right: parent.right
           	bottom: parent.bottom
           }
      	   width: parent.width
      	   height: page2.contentHeight   	   

    	  Label {
    	  	text: qsTr('© 2023 Giulio Sorrentino')
    	  	color: 'white'
       	    	Layout.fillWidth: true

    	  }
    	  Label {
    	  	text: qsTr('Sotto licenza GPL v3 o, secondo la tua opinione, qualsiasi\nversione successiva.')
    	  	color: 'white'
       	    	Layout.fillWidth: true
	  }
	  Label {
	  	text: qsTr('Dedicato alle mie tre dame')
	  	color: 'white'
       	    	Layout.fillWidth: true
	  }	  
	  Label {
	  	text: qsTr('Pagina del progetto: https://github.com/numerunix/qmlfortune')
	  	color: 'white'
       	    	Layout.fillWidth: true
	  }
    	  
   }	
      }
   }
}
