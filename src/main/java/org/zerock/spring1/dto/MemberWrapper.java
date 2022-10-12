package org.zerock.spring1.dto;

import java.lang.reflect.Member;
import java.util.List;

public class MemberWrapper {
    /**
    * ArrayList : 순차적으로 접근할 떄
    * LinkedList : 추가 및 삭제가 빈번하게 일어날 때
    * */
    private List<Member> arr;
}
