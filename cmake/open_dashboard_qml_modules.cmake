cmake_minimum_required(VERSION 2.8.11)

# Save the qml dir to a persistant global variable
set(OPEN_DASHBOARD_QML_MODULES_DIR "${CMAKE_CURRENT_LIST_DIR}/../modules" CACHE INTERNAL "OPEN_DASHBOARD_QML_MODULES_DIRS")

# Make qtcreator aware of modules
set(QML2_IMPORT_PATH "${OPEN_DASHBOARD_QML_MODULES_DIR}" CACHE STRING "Qt Creator 4.1 extra qml import paths" FORCE)
set(QML_IMPORT_PATH "${OPEN_DASHBOARD_QML_MODULES_DIR}" CACHE STRING "Qt Creator 4.1 extra qml import paths" FORCE)

#
# Init a target to copy Qml modules from source to binary tree to make them available
# without the need to set environment variables explicitly
#
function(open_dashboard_qml_modules_init)

	set(OPEN_DASHBOARD_QML_MODULES_COPY_TARGET "open_dashboard_qml_modules_dir_copy_target_${TARGET_NAME}")

	# Add copy target which is always out-of-date and therefore gets always executed
	add_custom_target(${IFST_QTQMLUTILITIESLIBRARY_COPY_TARGET}
		ALL
	)

	# Add the copy command to be executed when the target is executed
	add_custom_command(TARGET ${OPEN_DASHBOARD_QML_MODULES_COPY_TARGET} POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_directory ${OPEN_DASHBOARD_QML_MODULES_DIR} $<TARGET_FILE_DIR:${TARGET_NAME}>
	)


endfunction(open_dashboard_qml_modules_init)
