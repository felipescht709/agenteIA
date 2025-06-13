const venom = require('venom-bot');

venom
  .create({
    session: 'agente-ia',
    headless: false, // Desliga o modo invisível
    devtools: true,  // (opcional) Abre devtools automaticamente
    browserArgs: ['--start-maximized']

  })
  .then((client) => start(client))
  .catch((erro) => {
    console.log(erro);
  });

function start(client) {
  client.onMessage(async (message) => {
    console.log('Recebido:', message.body); // Para ver se o bot está recebendo a mensagem corretamente
     
    if (message.isGroupMsg) {
      console.log('Mensagem em grupo ignorada.');
      return;
    }
    // Responde a qualquer mensagem simples
    if (message.body.toLowerCase().includes('oi')) {
      await client.sendText(message.from, 'Olá! Sou seu agente IA em teste ✅');
      console.log('Mensagem enviada com sucesso.');
    }
  });
}