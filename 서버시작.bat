@echo off
chcp 65001 > nul
echo.
echo  인타임 도서관 — 로컬 서버 시작
echo  ──────────────────────────────────
echo.

:: Python 3 확인
python --version > nul 2>&1
if %errorlevel% equ 0 (
    echo  브라우저에서 열기: http://localhost:8080
    echo  종료: Ctrl + C
    echo.
    python -m http.server 8080
) else (
    :: Python 없으면 npx serve 시도
    npx serve -l 8080 . 2> nul
    if %errorlevel% neq 0 (
        echo  Python 또는 Node.js가 설치되어 있지 않습니다.
        echo  https://www.python.org 에서 Python을 설치해주세요.
        pause
    )
)
