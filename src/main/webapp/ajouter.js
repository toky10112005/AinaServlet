function ajouter() {
    let getdiv = document.getElementById("f");
    let p = document.createElement("p");

    let inputIdCheque = document.createElement("input");
    inputIdCheque.setAttribute("type", "hidden");
    inputIdCheque.setAttribute("name", "id_cheque");
    inputIdCheque.setAttribute("value", id_cheque);
    p.appendChild(inputIdCheque);

    let btnSau = document.createElement("input");
    btnSau.setAttribute("type","submit");
    btnSau.setAttribute("value","Sau");

    let labelDate = document.createElement("label");
    labelDate.setAttribute("for","dateajout");
    labelDate.innerText = "Date : ";
    let inputDate = document.createElement("input");
    inputDate.setAttribute("type","text");
    inputDate.setAttribute("name","dateajout");

    let labelEtat = document.createElement("label");
    labelEtat.setAttribute("for","etat");
    labelEtat.innerText = "Etat Cheque : ";
    let selectEtat = document.createElement("select");
    selectEtat.setAttribute("name","etat");
    selectEtat.innerHTML = etatOptions;

    let labelBeneficiaire = document.createElement("label");
    labelBeneficiaire.setAttribute("for","beneficiaire");
    labelBeneficiaire.innerText = "Beneficiaire : ";
    let inputBeneficiaire = document.createElement("input");
    inputBeneficiaire.setAttribute("type","text");
    inputBeneficiaire.setAttribute("name","beneficiaire");

    p.appendChild(labelDate);
    p.appendChild(inputDate);
    p.appendChild(labelEtat);
    p.appendChild(selectEtat);
    p.appendChild(labelBeneficiaire);
    p.appendChild(inputBeneficiaire);
    p.appendChild(btnSau);
    
    getdiv.appendChild(p);
}