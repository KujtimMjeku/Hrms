package com.dms.mvc.services.interfaces;

import java.util.List;

import com.dms.mvc.data.entity.FileType;

public interface FileTypeService {
	List<FileType> getAll();
	FileType getFileTypeFromExtension(String extension);
	void deleteFileType(long id);
	FileType getById(long id);
	void save(FileType fileType);
}
