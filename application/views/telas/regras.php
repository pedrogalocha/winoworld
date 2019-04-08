<?php $this->load->view('header')?>
<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
<div class="col-sm-12">
<h1 class="text-ranking">Regras do Jogo</h1>
  <p>Winoworld é um jogo desenvolvido para equipe de TI da empresa Winover, o foco deste jogo é aumentar a produtividade e engagamento da equipe. 
  Utilizando os conceitos de gamefication, após um campeonato efetuado em 2018 foi perceptivel a melhora da equipe, mas também foi notado lacunas 
  que poderiam ser preenchidas para melhorar ainda mais a interação da equipe com o campeonato.
  Por este ponto, foi desenvolvido um sistema e foi aprimorado mêcanicas neste novo jogo.</p>
</div>
  <div class="col-sm-12">
  <h1 class="text-ranking">Como ganhar Xp?</h1>
  <p>Uma das formas mais eficazes de ganhar XP é efetuando tarefas.</p>
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">Nome da Tarefa</th>
          <th scope="col">XP</th>
          <th scope="col">Descrição</th>
        </tr>
      </thead>

      <tbody>
        <?php foreach ($tarefas as $tar){ ?>  
          <tr>
            <td><?= $tar->name_task; ?></td>
            <td><?= $tar->xp; ?></td>
            <td><?= $tar->desc; ?></td>
          </td>
          </tr>
        <?php }?>
      </tbody>
    </table>
  </div>
</div>
<?php $this->load->view('footer')?>