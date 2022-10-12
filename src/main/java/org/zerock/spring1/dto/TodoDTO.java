package org.zerock.spring1.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.Nullable;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TodoDTO {


//    private Long tno;
////
////    private String title, memo, writer;
////
////    private LocalDate dueDate;
////
////    private LocalDateTime regDate, modDate;
    private Long tno;
    private String title,memo,writer;
    private LocalDate dueDate;
    private LocalDateTime regDate, modDate;
}
