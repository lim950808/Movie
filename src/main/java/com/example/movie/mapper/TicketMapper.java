package com.example.movie.mapper;


import com.example.movie.dto.TicketDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TicketMapper {

	public int insertTicket(TicketDTO dto);

	public TicketDTO getTicket();

	public List<TicketDTO> getTicketList(String userId);

}
