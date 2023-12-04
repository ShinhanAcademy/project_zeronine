<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>
  .div {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .div-2 {
    display: flex;
    width: 100%;
    max-width: 1245px;
    align-items: start;
    justify-content: space-between;
    gap: 20px;
  }
  @media (max-width: 991px) {
    .div-2 {
      max-width: 100%;
      flex-wrap: wrap;
    }
  }
  .div-3 {
    display: flex;
    margin-top: 7px;
    flex-grow: 1;
    flex-basis: 0%;
    flex-direction: column;
  }
  .div-4 {
    display: flex;
    justify-content: space-between;
    gap: 6px;
  }
  @media (max-width: 991px) {
    .div-4 {
      justify-content: center;
    }
  }
  .img {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-5 {
    color: #000;
    text-align: center;
    align-self: center;
    margin: auto 0;
    font: 400 20px/16px Jura, sans-serif;
  }
  .div-6 {
    disply: flex;
    flex-direction: column;
    overflow: hidden;
    align-self: center;
    position: relative;
    display: flex;
    aspect-ratio: 1;
    width: 18px;
    justify-content: center;
    align-items: center;
    margin: auto 0;
  }
  .img-2 {
    position: absolute;
    inset: 0;
    height: 100%;
    width: 100%;
    object-fit: cover;
    object-position: center;
  }
  .img-3 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 100%;
    overflow: hidden;
  }
  .div-7 {
    border-radius: 0px 0px 15px 15px;
    border-right: 1px solid #000;
    border-bottom: 1px solid #000;
    border-left: 1px solid #000;
    background-color: rgba(255, 255, 255, 0.8);
    align-self: end;
    display: flex;
    margin-right: 10px;
    width: 73px;
    max-width: 100%;
    flex-direction: column;
    padding: 8px 10px;
  }
  .div-8 {
    color: #000;
    text-align: center;
    font: 400 20px/16px Jura, sans-serif;
  }
  .div-9 {
    background-color: #000;
    height: 1px;
  }
  .div-10 {
    color: #000;
    text-align: center;
    margin-top: 8px;
    white-space: nowrap;
    font: 400 20px/16px Jura, sans-serif;
  }
  @media (max-width: 991px) {
    .div-10 {
      white-space: initial;
    }
  }
  .div-11 {
    display: flex;
    gap: 19px;
  }
  .img-4 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 45px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-12 {
    color: #000;
    text-align: center;
    margin: auto 0;
    font: 400 30px/16px Jua, sans-serif;
  }
  .div-13 {
    align-self: stretch;
    width: 100%;
    padding: 0 20px;
  }
  @media (max-width: 991px) {
    .div-13 {
      max-width: 100%;
    }
  }
  .div-14 {
    gap: 20px;
    display: flex;
  }
  @media (max-width: 991px) {
    .div-14 {
      flex-direction: column;
      align-items: stretch;
      gap: 0px;
    }
  }
  .column {
    display: flex;
    flex-direction: column;
    line-height: normal;
    width: 33%;
    margin-left: 0px;
  }
  @media (max-width: 991px) {
    .column {
      width: 100%;
    }
  }
  .div-15 {
    border-radius: 15px;
    border: 1px solid #000;
    display: flex;
    width: 100%;
    flex-grow: 1;
    flex-direction: column;
    margin: 20px;
    padding: 34px 44px 34px 64px;
  }
  @media (max-width: 991px) {
    .div-15 {
      margin-top: 27px;
      padding: 0 20px;
    }
  }
  .img-5 {
    aspect-ratio: 1.07;
    object-fit: contain;
    object-position: center;
    width: 100%;
    overflow: hidden;
    align-self: stretch;
  }
  .div-16 {
    color: #000;
    align-self: stretch;
    margin-top: 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  .div-17 {
    align-self: start;
    display: flex;
    margin-top: 40px;
    gap: 6px;
  }
  .img-6 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-18 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-19 {
    align-self: stretch;
    display: flex;
    margin-top: 26px;
    justify-content: space-between;
    gap: 10px;
  }
  .img-7 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 26px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-20 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-21 {
    align-self: stretch;
    display: flex;
    margin-top: 21px;
    justify-content: space-between;
    gap: 8px;
  }
  .img-8 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-22 {
    color: #000;
    margin: auto 0;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-23 {
    color: #fff;
    text-align: center;
    white-space: nowrap;
    border-radius: 15px;
    background-color: #0083e6;
    align-self: end;
    margin-top: 50px;
    justify-content: center;
    padding: 13px 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  @media (max-width: 991px) {
    .div-23 {
      white-space: initial;
      margin-top: 40px;
      padding: 0 20px;
    }
  }
  .column-2 {
    display: flex;
    flex-direction: column;
    line-height: normal;
    width: 34%;
    margin-left: 20px;
  }
  @media (max-width: 991px) {
    .column-2 {
      width: 100%;
    }
  }
  .div-24 {
    border-radius: 15px;
    border: 1px solid #000;
    display: flex;
    width: 100%;
    flex-grow: 1;
    flex-direction: column;
    margin: 20px;
    padding: 34px 37px 34px 52px;
  }
  @media (max-width: 991px) {
    .div-24 {
      margin-top: 27px;
      padding: 0 20px;
    }
  }
  .img-9 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 290px;
    overflow: hidden;
    align-self: center;
    max-width: 100%;
  }
  .div-25 {
    color: #000;
    align-self: stretch;
    margin-top: 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  .div-26 {
    align-self: start;
    display: flex;
    margin-top: 42px;
    gap: 6px;
  }
  @media (max-width: 991px) {
    .div-26 {
      margin-top: 40px;
    }
  }
  .img-10 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-27 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-28 {
    align-self: stretch;
    display: flex;
    margin-top: 26px;
    justify-content: space-between;
    gap: 10px;
  }
  .img-11 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 26px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-29 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-30 {
    align-self: start;
    display: flex;
    margin-top: 21px;
    gap: 8px;
  }
  .img-12 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-31 {
    color: #000;
    margin: auto 0;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-32 {
    color: #fff;
    text-align: center;
    white-space: nowrap;
    border-radius: 15px;
    background-color: #0083e6;
    align-self: end;
    margin-top: 51px;
    justify-content: center;
    padding: 13px 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  @media (max-width: 991px) {
    .div-32 {
      white-space: initial;
      margin-top: 40px;
      padding: 0 20px;
    }
  }
  .column-3 {
    display: flex;
    flex-direction: column;
    line-height: normal;
    width: 33%;
    margin-left: 20px;
  }
  @media (max-width: 991px) {
    .column-3 {
      width: 100%;
    }
  }
  .div-33 {
    border-radius: 15px;
    border: 1px solid #000;
    display: flex;
    width: 100%;
    flex-grow: 1;
    flex-direction: column;
    margin: 0 auto;
    padding: 34px 30px 34px 52px;
  }
  @media (max-width: 991px) {
    .div-33 {
      margin-top: 27px;
      padding: 0 20px;
    }
  }
  .img-13 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 290px;
    overflow: hidden;
    align-self: center;
    max-width: 100%;
  }
  .div-34 {
    color: #000;
    align-self: stretch;
    margin-top: 39px;
    font: 400 25px/16px Jua
  }
  .div-35 {
    align-self: start;
    display: flex;
    margin-top: 42px;
    gap: 6px;
  }
  @media (max-width: 991px) {
    .div-35 {
      margin-top: 40px;
    }
  }
  .img-14 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-36 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-37 {
    align-self: stretch;
    display: flex;
    margin-top: 26px;
    justify-content: space-between;
    gap: 10px;
  }
  .img-15 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 26px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-38 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-39 {
    align-self: start;
    display: flex;
    margin-top: 21px;
    gap: 8px;
  }
  .img-16 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-40 {
    color: #000;
    margin: auto 0;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-41 {
    color: #fff;
    text-align: center;
    white-space: nowrap;
    border-radius: 15px;
    background-color: #0083e6;
    align-self: end;
    margin-top: 51px;
    justify-content: center;
    padding: 13px 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  @media (max-width: 991px) {
    .div-41 {
      white-space: initial;
      margin-top: 40px;
    }
  }
  .div-42 {
    align-self: stretch;
    margin-top: 55px;
    width: 100%;
    padding: 0 20px;
  }
  @media (max-width: 991px) {
    .div-42 {
      max-width: 100%;
      margin-top: 40px;
    }
  }
  .div-43 {
    gap: 20px;
    display: flex;
  }
  @media (max-width: 991px) {
    .div-43 {
      flex-direction: column;
      align-items: stretch;
      gap: 0px;
    }
  }
  .div-44 {
    border-radius: 15px;
    border: 1px solid #000;
    display: flex;
    width: 100%;
    flex-grow: 1;
    flex-direction: column;
    margin: 0 auto;
    padding: 35px 16px 35px 52px;
  }
  @media (max-width: 991px) {
    .div-44 {
      margin-top: 28px;
      padding-left: 20px;
    }
  }
  .img-17 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 290px;
    overflow: hidden;
    align-self: center;
    max-width: 100%;
  }
  .div-45 {
    color: #000;
    align-self: stretch;
    margin-top: 40px;
    font: 400 25px/16px Jua, sans-serif;
  }
  .div-46 {
    align-self: start;
    display: flex;
    margin-top: 49px;
    gap: 6px;
  }
  @media (max-width: 991px) {
    .div-46 {
      margin-top: 40px;
    }
  }
  .img-18 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-47 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-48 {
    align-self: stretch;
    display: flex;
    margin-top: 26px;
    justify-content: space-between;
    gap: 10px;
  }
  .img-19 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 26px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-49 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-50 {
    align-self: start;
    display: flex;
    margin-top: 21px;
    gap: 8px;
  }
  .img-20 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-51 {
    color: #000;
    margin: auto 0;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-52 {
    color: #fff;
    text-align: center;
    white-space: nowrap;
    border-radius: 15px;
    background-color: #0083e6;
    align-self: end;
    justify-content: center;
    margin: 42px 28px 0 0;
    padding: 13px 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  @media (max-width: 991px) {
    .div-52 {
      white-space: initial;
      margin: 40px 10px 0 0;
      padding: 0 20px;
    }
  }
  .column-4 {
    display: flex;
    flex-direction: column;
    line-height: normal;
    width: 34%;
    margin-left: 20px;
  }
  @media (max-width: 991px) {
    .column-4 {
      width: 100%;
    }
  }
  .div-53 {
    border-radius: 15px;
    border: 1px solid #000;
    display: flex;
    width: 100%;
    flex-grow: 1;
    flex-direction: column;
    margin: 0 auto;
    padding: 36px 38px 36px 52px;
  }
  @media (max-width: 991px) {
    .div-53 {
      margin-top: 28px;
      padding: 0 20px;
    }
  }
  .img-21 {
    aspect-ratio: 1.13;
    object-fit: contain;
    object-position: center;
    width: 100%;
    overflow: hidden;
    align-self: stretch;
  }
  .div-54 {
    color: #000;
    align-self: stretch;
    margin-top: 35px;
    font: 400 25px/16px Jua, sans-serif;
  }
  .div-55 {
    align-self: start;
    display: flex;
    margin-top: 64px;
    gap: 6px;
  }
  @media (max-width: 991px) {
    .div-55 {
      margin-top: 40px;
    }
  }
  .img-22 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-56 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-57 {
    align-self: stretch;
    display: flex;
    margin-top: 26px;
    justify-content: space-between;
    gap: 10px;
  }
  .img-23 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 26px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-58 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-59 {
    align-self: start;
    display: flex;
    margin-top: 21px;
    gap: 8px;
  }
  .img-24 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-60 {
    color: #000;
    margin: auto 0;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-61 {
    color: #fff;
    text-align: center;
    white-space: nowrap;
    border-radius: 15px;
    background-color: #0083e6;
    align-self: end;
    margin-top: 27px;
    justify-content: center;
    padding: 13px 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  @media (max-width: 991px) {
    .div-61 {
      white-space: initial;
      padding: 0 20px;
    }
  }
  .column-5 {
    display: flex;
    flex-direction: column;
    line-height: normal;
    width: 33%;
    margin-left: 20px;
  }
  @media (max-width: 991px) {
    .column-5 {
      width: 100%;
    }
  }
  .div-62 {
    border-radius: 15px;
    border: 1px solid #000;
    display: flex;
    width: 100%;
    flex-grow: 1;
    flex-direction: column;
    margin: 0 auto;
    padding: 36px 30px 36px 52px;
  }
  @media (max-width: 991px) {
    .div-62 {
      margin-top: 28px;
      padding: 0 20px;
    }
  }
  .img-25 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 290px;
    overflow: hidden;
    align-self: center;
    max-width: 100%;
  }
  .div-63 {
    color: #000;
    align-self: stretch;
    margin-top: 35px;
    font: 400 25px/16px Jua, sans-serif;
  }
  .div-64 {
    align-self: start;
    display: flex;
    margin-top: 35px;
    gap: 6px;
  }
  .img-26 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-65 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-66 {
    align-self: stretch;
    display: flex;
    margin-top: 26px;
    justify-content: space-between;
    gap: 10px;
  }
  .img-27 {
    aspect-ratio: 1;
    object-fit: contain;
    object-position: center;
    width: 26px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-67 {
    color: #000;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-68 {
    align-self: start;
    display: flex;
    margin-top: 21px;
    gap: 8px;
  }
  .img-28 {
    aspect-ratio: 1.3;
    object-fit: contain;
    object-position: center;
    width: 30px;
    overflow: hidden;
    max-width: 100%;
  }
  .div-69 {
    color: #000;
    margin: auto 0;
    font: 300 20px/16px Lato, sans-serif;
  }
  .div-70 {
    color: #fff;
    text-align: center;
    white-space: nowrap;
    border-radius: 15px;
    background-color: #0083e6;
    align-self: end;
    margin-top: 26px;
    justify-content: center;
    padding: 13px 39px;
    font: 400 25px/16px Jua, sans-serif;
  }
  @media (max-width: 991px) {
    .div-70 {
      white-space: initial;
      padding: 0 20px;
    }
  }
</style>
</head>
<body>

  <div class="div-11">
      <img
        loading="lazy"
        srcset="..."
        class="img-4"
      />
      <div class="div-12">글쓰기</div>
    </div>
  </div>
  <div class="div-13">
    <div class="div-14">
      <div class="column">
        <div class="div-15">
          <img
            loading="lazy"
            srcset="..."
            class="img-5"
          />
          <div class="div-16">
            마녀공장
            <br />
            <br />
            [1+1] 판테토인 에센스 토너 200ml
          </div>
          <div class="div-17">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/e191c0b3552e1888dece14a55e8235ac6e2ee33b46b95ee55eda31636ca34cc1?"
              class="img-6"
            />
            <div class="div-18">1명 모집</div>
          </div>
          <div class="div-19">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/10b5214b93338c8e3b7d62d324ae474e020705d48d9c8743e79a1ddaf48d28bd?"
              class="img-7"
            />
            <div class="div-20">23.11.30 23:59 까지</div>
          </div>
          <div class="div-21">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/c43e9c845fc7e665c27fcf2862fb7901dbbb3810a970b1a60bc551f915b3a986?"
              class="img-8"
            />
            <div class="div-22">16,640 원</div>
          </div>
          <div class="div-23">보기</div>
        </div>
      </div>
      <div class="column-2">
        <div class="div-24">
          <img
            loading="lazy"
            srcset="..."
            class="img-9"
          />
          <div class="div-25">
            슈가버블
            <br />
            <br />
            마일드 그레인 주방세제 기획 940mL*2
          </div>
          <div class="div-26">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/e191c0b3552e1888dece14a55e8235ac6e2ee33b46b95ee55eda31636ca34cc1?"
              class="img-10"
            />
            <div class="div-27">1명 모집</div>
          </div>
          <div class="div-28">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/10b5214b93338c8e3b7d62d324ae474e020705d48d9c8743e79a1ddaf48d28bd?"
              class="img-11"
            />
            <div class="div-29">23.11.30 23:59 까지</div>
          </div>
          <div class="div-30">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/c43e9c845fc7e665c27fcf2862fb7901dbbb3810a970b1a60bc551f915b3a986?"
              class="img-12"
            />
            <div class="div-31">16,640 원</div>
          </div>
          <div class="div-32">보기</div>
        </div>
      </div>
      <div class="column-3">
        <div class="div-33">
          <img
            loading="lazy"
            srcset="..."
            class="img-13"
          />
          <div class="div-34">
            오랄비
            <br />
            <br />
            칫솔 벨벳 초미세모 초소형헤드 3개입
          </div>
          <div class="div-35">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/e191c0b3552e1888dece14a55e8235ac6e2ee33b46b95ee55eda31636ca34cc1?"
              class="img-14"
            />
            <div class="div-36">2명 모집</div>
          </div>
          <div class="div-37">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/10b5214b93338c8e3b7d62d324ae474e020705d48d9c8743e79a1ddaf48d28bd?"
              class="img-15"
            />
            <div class="div-38">23.11.29 23:59 까지</div>
          </div>
          <div class="div-39">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/c98512aa3aa377ba1f1e2387b9f3d222ac857d4f606d2432666c7aa325568b36?"
              class="img-16"
            />
            <div class="div-40">16,640 원</div>
          </div>
          <div class="div-41">보기</div>
        </div>
      </div>
    </div>
  </div>
  <div class="div-42">
    <div class="div-43">
      <div class="column">
        <div class="div-44">
          <img
            loading="lazy"
            srcset="..."
            class="img-17"
          />
          <div class="div-45">
            2080
            <br />
            <br />
            진지발리스 오리지날 120g*3입 [의약외품]
          </div>
          <div class="div-46">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/1ca7e3e164cbdd65ee84c79ae6552391b034b01d7ac80952376e3f3ceb84c783?"
              class="img-18"
            />
            <div class="div-47">1명 모집</div>
          </div>
          <div class="div-48">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/0eaee763d916b00f8b2ba26b94303f1c367e187115eb956365848cbe015e35f6?"
              class="img-19"
            />
            <div class="div-49">23.11.29 23:59 까지</div>
          </div>
          <div class="div-50">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/c98512aa3aa377ba1f1e2387b9f3d222ac857d4f606d2432666c7aa325568b36?"
              class="img-20"
            />
            <div class="div-51">16,640 원</div>
          </div>
          <div class="div-52">보기</div>
        </div>
      </div>
      <div class="column-4">
        <div class="div-53">
          <img
            loading="lazy"
            srcset="..."
            class="img-21"
          />
          <div class="div-54">
            롯데칠성
            <br />
            <br />
            [롯데] 게토레이 1.5L
          </div>
          <div class="div-55">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/1ca7e3e164cbdd65ee84c79ae6552391b034b01d7ac80952376e3f3ceb84c783?"
              class="img-22"
            />
            <div class="div-56">1명 모집</div>
          </div>
          <div class="div-57">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/0eaee763d916b00f8b2ba26b94303f1c367e187115eb956365848cbe015e35f6?"
              class="img-23"
            />
            <div class="div-58">23.11.29 23:59 까지</div>
          </div>
          <div class="div-59">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/c98512aa3aa377ba1f1e2387b9f3d222ac857d4f606d2432666c7aa325568b36?"
              class="img-24"
            />
            <div class="div-60">16,640 원</div>
          </div>
          <div class="div-61">보기</div>
        </div>
      </div>
      <div class="column-5">
        <div class="div-62">
          <img
            loading="lazy"
            srcset="..."
            class="img-25"
          />
          <div class="div-63">
            햇반
            <br />
            <br />
            CJ 햇반 플랜테이블 병아리콩
            <br />
            <br />
            그레인보울 160G
          </div>
          <div class="div-64">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/1ca7e3e164cbdd65ee84c79ae6552391b034b01d7ac80952376e3f3ceb84c783?"
              class="img-26"
            />
            <div class="div-65">1명 모집</div>
          </div>
          <div class="div-66">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/0eaee763d916b00f8b2ba26b94303f1c367e187115eb956365848cbe015e35f6?"
              class="img-27"
            />
            <div class="div-67">23.11.29 23:59 까지</div>
          </div>
          <div class="div-68">
            <img
              loading="lazy"
              src="https://cdn.builder.io/api/v1/image/assets/TEMP/c98512aa3aa377ba1f1e2387b9f3d222ac857d4f606d2432666c7aa325568b36?"
              class="img-28"
            />
            <div class="div-69">16,640 원</div>
          </div>
          <div class="div-70">보기</div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>