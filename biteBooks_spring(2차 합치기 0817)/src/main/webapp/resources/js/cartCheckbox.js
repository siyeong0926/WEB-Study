
    $(document).ready(function() {
    // 전체 선택 체크박스를 참조합니다.
    const selectAllCheckbox = $('#selectAll');
    // 모든 옵션 체크박스들을 참조합니다.
    const checkboxes = $('.form-check-input[name="cartToOrder[]"]');

        // 선택된 체크박스의 개수를 업데이트하는 함수
        function updateSelectedCount() {
            // 선택된 체크박스의 개수 계산
            const selectedCount = checkboxes.filter(":checked").length;
            // 화면에 표시
            $("#selectedCount").text(selectedCount + "개를 선택하셨습니다.");
        } // ---------------------end of 체크박스 개수 함수------------------------
        // 선택된 체크박스의 총 가격을 계산하고 화면에 표시하는 함수
        function updateTotalPrice() {
            let total = 0;
            // 선택된 체크박스의 'data-price' 값을 가져와 합산
            checkboxes.filter(":checked").each(function() {
                total += parseInt($(this).data('price'));
            });
            // 총 가격을 화면에 표시
            $(".totalPrice").text(total + "원");
        } // --------------------end of 체크된 합계 금액-----------------------------

        // 개별 체크박스의 상태가 변경될 때 실행될 이벤트 핸들러
        checkboxes.on('change', function() {
        // 현재 체크박스가 체크 해제되었는지 확인
        if (!$(this).prop('checked')) {
        // 체크 해제된 경우, 전체 선택 체크박스도 체크 해제
        selectAllCheckbox.prop('checked', false);
    } else {
        // 그렇지 않으면 모든 체크박스가 선택되었는지 확인
        const allChecked = checkboxes.length === checkboxes.filter(":checked").length;
        // 모든 체크박스가 선택되었으면 전체 선택 체크박스도 체크
        selectAllCheckbox.prop('checked', allChecked);
    }
        // 선택된 체크박스의 개수 업데이트
        updateSelectedCount();
        // 총 가격 업데이트
        updateTotalPrice();
    }); // end of 개별 체크박스 이벤트 리스너----------------------------------------

    // 전체 선택 체크박스의 상태가 변경될 때 실행될 이벤트 리스너
    selectAllCheckbox.on('change', function() {
    // 전체 선택 체크박스의 상태에 따라 모든 체크박스의 상태를 변경
    checkboxes.prop('checked', $(this).prop('checked'));
    // 선택된 체크박스의 개수 업데이트
    updateSelectedCount();
    // 총 가격 업데이트
    updateTotalPrice();
    }); // end of 전체 선택 체크박스 이벤트 리스너-------------------------------------


});
