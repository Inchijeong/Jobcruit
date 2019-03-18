package com.jobcruit.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jobcruit.domain.FreeAttach;

public interface AttachMapper {
	
	//@Insert("insert into tb_recruit_attach(tno, fname) values(#{tno}, #{fileName})")
	public void addAttach(@Param("tno")Long tno, @Param("fileName")String fileName);
	
	@Insert("insert into tb_free_attach (fno, file_name) values (#{fno}, #{fileName})")
	public void addFreeAttach(@Param("fno") Integer fno, @Param("fileName") String fileName);
	
	public List<FreeAttach> getFreeAttach(Integer fno);
}
  