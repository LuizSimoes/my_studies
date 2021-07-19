const cep = document.querySelector("#cep");

// como o resultado precisa ser tratado, vem no formato de  objeto e campos que não preciso
const tratarResultado = (resultado) => {
  for(const campo in resultado) { // para cada um dos campos do objeto armazena o nome na constante CAMPO
    console.log(campo); // pra ver o que retorna, observa o nome dos campos

    /* o for/in trouxe todos os campos, por isso o IF
        se o campo bate com o id no HTML, use-o! Observação: tem que ter o mesmo nome no HTML
    */
    if(document.querySelector("#" + campo)) {
      console.log(campo); // pra ver que já está o campo que eu preciso
      document.querySelector(`#${campo}`).value = resultado[campo]; // VEJA que o valor do querySelector é igual o do IF, só fiz em template string para vc entender.
      // a linha acima põe o value de cada campo de acordo com o resultado recebido em cada pelo resultado.
    }
  }
};

/* a função captura o que foi digitado no campo CEP
 addEventListener recebe um tipo de evento ("blur") e uma função, ou seja, o que
 fará quando o evento acontecer, no caso fiz uma arrow function (função abreviada)
 O evento blur é acionado quando um elemento perde foco.
*/

cep.addEventListener("blur",(event) => {
  let limpaCep = cep.value.replace("-", ""); // só tira o traço se colocado

  // colocar no navegador para mostrar como retorna (usar extensão do chrome JSON Viewer):
  //  https://viacep.com.br/ws/11340350/json/

// observar que o url fica numa template String envolvida por crase, entre {} recebe a varíável
// esse é único parâmetro obrigatório no fetch
  fetch(`https://viacep.com.br/ws/${limpaCep}/json/`)
  // quando usamos um fetch/API nós temos uma promessa (promisse), não sabemos o resultado,
  // sai do nosso controle, pra isso usamos then/catch

  // o fetch pode receber um seguinte parâmetro onde podemos passar um objeto de configuração
  
  /*
          const config = {
            method: 'GET',
            mode: 'cors',
            cache: 'default'
          }
          fetch(`https://viacep.com.br/ws/${limpaCep}/json/`, config);
  */

  // se der certo faça isso .then
  .then(response => { response.json() // converte em Json, mas como não sabemos se irá retornar usamos outro .then
    .then(data => tratarResultado(data))
  })

  // se der errado faça isso .catch
  .catch(error => console.log('Erro: '+ error, message));
});
