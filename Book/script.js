document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.form-control');
    const episodes = document.querySelectorAll('.episode-row');
    const selectAllBtn = document.querySelector('.btn-select-all');
    const collectBtn = document.querySelector('.btn-collect');

    // 실시간 검색 필터링
    searchInput.addEventListener('input', function() {
        const query = this.value.toLowerCase();
        episodes.forEach(function(episodeRow) {
            const episodeText = episodeRow.textContent.toLowerCase();
            if (episodeText.includes(query)) {
                episodeRow.style.display = '';
            } else {
                episodeRow.style.display = 'none';
            }
        });
    });

    // 전체 선택 기능
    selectAllBtn.addEventListener('click', function() {
        episodes.forEach(function(episodeRow) {
            const checkbox = episodeRow.querySelector('input[type="checkbox"]');
            checkbox.checked = true;
        });
    });

    // 소장하기 기능
    collectBtn.addEventListener('click', function() {
        let selectedEpisodes = [];
        episodes.forEach(function(episodeRow) {
            const checkbox = episodeRow.querySelector('input[type="checkbox"]');
            if (checkbox.checked) {
                selectedEpisodes.push(checkbox.value);
            }
        });
        if (selectedEpisodes.length > 0) {
            alert('다음 에피소드가 소장 리스트에 추가되었습니다: ' + selectedEpisodes.join(', '));
        } else {
            alert('소장할 에피소드를 선택해주세요.');
        }

        // 별점 기능
        const stars = document.querySelectorAll('.star');

        stars.forEach(star => {
            star.addEventListener('click', function() {
                let value = parseInt(star.getAttribute('data-value'));
                stars.forEach((s, index) => {
                    if (index < value) {
                        s.innerHTML = '&#9733;'; // 선택된 별
                        s.style.color = 'red'; // 선택된 별은 빨간색으로
                    } else {
                        s.innerHTML = '&#9734;'; // 비선택 상태의 별
                        s.style.color = ''; // 기본 색으로 설정
                    }
                });
            });
        });


// 리뷰 제출 버튼 클릭 시
        document.querySelector('.btn-primary').addEventListener('click', function() {
            if (selectedRating === 0) {
                alert('별점을 선택해주세요.');
                return;
            }
            const reviewText = document.getElementById('review-text').value;
            if (!reviewText) {
                alert('리뷰를 작성해주세요.');
                return;
            }
            alert('리뷰가 제출되었습니다. 별점: ' + selectedRating + ', 리뷰 내용: ' + reviewText);
        });




    });
});
