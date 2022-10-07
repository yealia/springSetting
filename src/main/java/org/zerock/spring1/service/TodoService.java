package org.zerock.spring1.service;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Service;
import org.zerock.spring1.dao.TodoDAO;

@Service
@ToString
@RequiredArgsConstructor
public class TodoService {

    private final TodoDAO dao;
}
