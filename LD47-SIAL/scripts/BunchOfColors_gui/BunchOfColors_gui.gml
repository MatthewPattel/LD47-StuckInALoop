///@function col(0-12)
///@description Divides the application window in 12 columns (horizontally)
///@param {real} 0-12
function col(_column) {
	return (window_get_width()/12)*clamp(_column,0,12);
}

///@function row(0-12)
///@description Divides the application window in 12 rows (vertically)
///@param {real} 0-12
function row(_row) {
	return (window_get_height()/12)*clamp(_row,0,12);
}
