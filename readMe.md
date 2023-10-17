
# Dondoc

> **삼성청년SW아카데미(SSAFY)** <br/> **개발기간: 2023.8.28 ~ 2023.10.06**

## 배포 주소

> **배포 주소** : [http://j9d108.p.ssafy.io:5174](http://j9d108.p.ssafy.io:5174)

## 개발팀 소개


|                                                            강승현                                                             |                                                            송민철                                                             |                                                            유영서                                                            |
| :---------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------: |
| <img width="160px" src="https://github.com/mincheolsong/mincheolsong/assets/80660585/87e8e0d4-6e03-4cf1-bf6d-97610ce60c17" /> | <img width="160px" src="https://github.com/mincheolsong/mincheolsong/assets/80660585/19c30455-4129-4d00-a06a-ed76c6221464" /> | <img width="160px" src="https://github.com/mincheolsong/mincheolsong/assets/80660585/14ed2534-dbe4-4b99-b133-80fd6b56187a"/> |
|                                         [@kshv02](https://lab.ssafy.com/kshv02)                                         |                                          [@thdalscjf05](https://lab.ssafy.com/thdalscjf05)                                          |                                      [@you2882](https://lab.ssafy.com/you2882)                                       |
|                                                            BackEnd                                                            |                                                            BackEnd                                                            |                                                           BackEnd                                                            |

김동혁                                                             |                                                            신제형                                                             |                                                            안영기                                                            |
| :---------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------: |
| <img width="160px" src="https://github.com/mincheolsong/mincheolsong/assets/80660585/08b72794-e12f-4cc0-867f-11b77721b34d" /> | <img width="160px" src="https://github.com/mincheolsong/mincheolsong/assets/80660585/23d95afd-6ccf-402c-b970-c6142268ef62" /> | <img width="160px" src="https://github.com/mincheolsong/mincheolsong/assets/80660585/8ac1f0bd-5e2c-49cc-bf5c-3d30bd46750c"/> |
|                                         [@fhg4561](https://lab.ssafy.com/fhg4561)                                         |                                          [@tlswpgud22](https://lab.ssafy.com/tlswpgud22)                                          |                                      [@thfl9281](https://lab.ssafy.com/thfl9281)                                       |
|                                                            FrontEnd                                                            |                                                            FrontEnd                                                            |                                                           FrontEnd                                                            |

## 프로젝트 소개

DonDoc은 공동계좌 서비스를 통한 자산관리 서비스를 제공합니다.

#### 사용자는 모임계좌에 송금을 요청할 수 있습니다.
모임계좌에 송금을 요청하고 관리자는 승인 또는 거부할 수 있습니다. 이러한 기능은 부모와 자식 간 용돈 거래에 활용할 수 있습니다.

#### 사용자는 미션을 할당받습니다.
관리자는 모임멤버에게 미션을 할당할 수 있습니다. 멤버가 미션을 성공하면 할당된 금액만큼 송금이 이루어지게 됩니다.


## 핵심 구현사항

### 은행서버를 구축하였습니다.

![image](https://github.com/mincheolsong/mincheolsong/assets/80660585/c46a355e-3d8e-4fa6-8933-2f714573655e)

예금주 생성, 계좌개설, 계좌이체가 가능한 저희만의 은행 서버를 제작하였습니다.  
DonDoc서비스의 모든 은행거래는 이 서버를 통해 이루어지게 됩니다.

### 기본적인 은행업무를 수행할 수 있습니다.

![image](https://github.com/mincheolsong/mincheolsong/assets/80660585/849447f1-c4b0-4359-90a9-ddfc48b22a99)

`계좌조회`, `거래내역조회`, `계좌이체`와 같은 기본적인 은행업무가 가능합니다.

### 모임계좌를 통한 송금요청과 마이데이터 조회가 가능합니다.

- 모임계좌

<img src="https://github.com/mincheolsong/mincheolsong/assets/80660585/a634628e-8535-4db9-87ea-766fe7d6d01e" width="250" height="500">  
  
모임별 멤버를 한 눈에 볼 수 있습니다.  
관리자는 모임계좌의 잔고를 볼 수 있습니다.

- 송금요청

![image](https://github.com/mincheolsong/mincheolsong/assets/80660585/6239c157-6b88-4792-a30c-bb73cfe6e1db)  
멤버는 모임 계좌에 대한 송금을 요청할 수 있습니다.  
관리자의 승인이 이루어 져야 송금이 발생합니다.

- 마이데이터

![image](https://github.com/mincheolsong/mincheolsong/assets/80660585/524d805f-1657-430b-9ec1-97f31dafba0f)  
모임의 멤버별 사용내역 데이터를 시각화 하였습니다.

## Stacks 🐈

### Environment

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-007ACC?style=for-the-badge&logo=Visual%20Studio%20Code&logoColor=white)
![IntelliJ](https://img.shields.io/badge/IntelliJ-181717?style=for-the-badge&logo=intellijidea&logoColor=#000000)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white)
![gitlab](https://img.shields.io/badge/gitlab-FC6D26?style=for-the-badge&logo=gitlab&logoColor=BLACK)

### CI/CD

![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![AmazonEC2](https://img.shields.io/badge/AmazonEC2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white)

### Development

![TypeScript](https://img.shields.io/badge/TypeScript-F7DF1E?style=for-the-badge&logo=typescript&logoColor=white)
![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![redux](https://img.shields.io/badge/redux-764ABC?style=for-the-badge&logo=redux&logoColor=61DAFB)
![SpringBoot](https://img.shields.io/badge/SpringBoot-6DB33F?style=for-the-badge&logo=SpringBoot&logoColor=black)
![springsecurity](https://img.shields.io/badge/springsecurity-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)
![MySql](https://img.shields.io/badge/MySql-4479A1?style=for-the-badge&logo=MySql&logoColor=black)

### Communication

![Jira](https://img.shields.io/badge/jira-4A154B?style=for-the-badge&logo=jirasoftware&logoColor=blue)
![Notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white)

---

## 아키텍쳐

![image](https://github.com/mincheolsong/mincheolsong/assets/80660585/d6d968b7-937d-4661-8586-53de2bbc1000)
