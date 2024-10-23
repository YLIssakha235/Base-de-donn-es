create assertion ASSERTON_COMDET
    check (
        (select count(*) from COMMANDE where NCOM not in (select NCOM from DETAIL))
        >0
    )

  
alter table DETAIL 
    add constraint C_QCOM check(QCOM > 0) 
-- La quantité commandée doit être > 0 

alter table CLIENT 
    add constraint C_SEXE check(SEXE is null or SEXE in ('M','F')) 
-- sans commentaire

alter table DETAIL 
    add constraint C_Q 
    check(QCOM <= (select QSTOCK from PRODUIT where NPRO = DETAIL.NPRO))
-- pas commander un produit non en stock   