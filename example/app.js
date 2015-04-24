// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// TODO: write your module tests here
var Drawer = require('guy.mcdooooo.tibezier');

// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

var canvas = Drawer.createView({
	width: 88,
	height: 76,
	bezier: {
		lineWidth: 2,
		miterLimit: 4,
		strokeColor: '#FF2D55',
		fillColor: 'transparent',
		paths: [{
			draw: 'moveToPoint',
			point: [64.22, 0]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [48.27, 6.18],
			controlPoint1: [58.33, 0],
			controlPoint2: [52.67, 2.19]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [44, 11.31],
			controlPoint1: [46.6, 7.69],
			controlPoint2: [45.17, 9.41]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [39.73, 6.18],
			controlPoint1: [42.83, 9.41],
			controlPoint2: [41.4, 7.69]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [23.78, 0],
			controlPoint1: [35.33, 2.19],
			controlPoint2: [29.67, 0]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [0, 23.82],
			controlPoint1: [10.67, 0],
			controlPoint2: [0, 10.69]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [9.21, 47.23],
			controlPoint1: [0, 32.69],
			controlPoint2: [2.75, 39.69]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [43.32, 75.62],
			controlPoint1: [18.58, 58.19],
			controlPoint2: [42.31, 74.91]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [44, 75.83],
			controlPoint1: [43.52, 75.76],
			controlPoint2: [43.76, 75.83]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [44.68, 75.62],
			controlPoint1: [44.24, 75.83],
			controlPoint2: [44.48, 75.76]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [78.8, 47.23],
			controlPoint1: [45.69, 74.91],
			controlPoint2: [69.42, 58.19]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [88, 23.82],
			controlPoint1: [85.25, 39.69],
			controlPoint2: [88, 32.69]
		}, {
			draw: 'addCurveToPoint',
			endPoint: [64.22, 0],
			controlPoint1: [88, 10.69],
			controlPoint2: [77.33, 0]
		}, {
			draw: 'closePath'
		}]
	}
});

win.add( canvas );
win.open();






