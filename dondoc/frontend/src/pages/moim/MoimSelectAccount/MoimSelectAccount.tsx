import { useState } from 'react';
import styles from "./MoimSelectAccount.module.css";
import { useNavigate, useLocation } from "react-router-dom";
import { BackLogoHeader } from '../../toolBox/BackLogoHeader/BackLogoHeader';


type datas = {type:object,
  name:string,
  info:string,
  code:number
}

type data = {
  name:string,
  info:string,
  code:number
}


const datas = [
  {
    'name': '한명 관리',
    'info': '한명 관리 계좌는 관리자 한명이 계좌의 이체권한을 가지는 모임통장 형식입니다.',
    'code': 1
  },
  {
    'name': '두명 관리',
    'info': '두명 관리 계좌는 두명의 관리자가 모임 계좌의 입출금 권한을 가지고, 관리자의 승인을 통해 입출금 가능한 계좌입니다. 관리자 또한 다른 관리자의 승인을 받은 수 입출금이 가능합니다.',
    'code': 2
  },
  {
    'name': '공동 관리',
    'info': '공동 관리 계좌는 모든 구성원이 계좌 사용 승인 권한을 가지고 사용할 수 있는 계좌입니다.',
    'code': 3
  },
];

function MoimSelectAccount() {

  const [selectCategory, setSelectCategory] = useState<data>({
    name:'한명 관리',
    info:'한명 관리 계좌는 관리자 한명이 계좌의 이체권한을 가지는 모임통장 형식입니다.',
    code:1
  })

  const ChangeCategory = (type:data) => {
    setSelectCategory(type)
  }

  const navigate = useNavigate()

  const { state } = useLocation()
  const moimName = state.moimName
  const moimInfo = state.moimInfo
  const account = state.account

  const ToNext = () => {
    if(selectCategory.code) {
      navigate('/moimpassword', {state: {moimName:moimName, moimInfo:moimInfo, account:account, category:selectCategory}})
    } else {
      alert('계좌 유형을 선택해주세요.')
    }
  }


  return (
    <div className={styles.container}>
      <div className={styles.content}>
        <BackLogoHeader name="연결계좌"fontSize="2rem" left="5rem" top="0.8rem"/>

        <div className={styles.createcontent}>
          <div className={styles.createment}>
            <h1>계좌 유형을 선택해주세요.</h1>
          </div>

          <div className={styles.accountscategory}>
            <div className={styles.categoryinfo}>
              <div className={styles.accountinfo}>
                <p>{selectCategory.info}</p>
              </div>

              <div className={styles.selectcategories}>
                {datas.map((type, index) => (
                  <label htmlFor={`type-${index}`} key={index} onClick={() => ChangeCategory(type)}>
                    <div className={styles.selectunit}>
                      <div>{type.name}</div>
                      <input 
                        type="radio" 
                        id={`type-${index}`} 
                        checked={type.name === selectCategory.name}
                        onChange={() => {}}
                        />
                    </div>
                  </label>
                ))}

              </div>

            </div>
          </div>

        <div className={styles.buttondiv}>
            <button className={styles.submitbtn} onClick={ToNext}>다음</button>
        </div>

        </div>

      </div>
    </div>
  );
}

export default MoimSelectAccount;
