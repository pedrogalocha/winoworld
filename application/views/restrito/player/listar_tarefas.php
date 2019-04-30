<div class="col-sm-6">
  <h1>Tarefas <button class="botao-invisivel" type="button" data-toggle="modal" data-target="#addTarefa"><i class="far fa-plus-square"></i></button></h1>
</div>
<div class="col-sm-6">
<<<<<<< HEAD
<h1  style="text-align: right;">MERCADOR <button class="botao-invisivel" type="button" data-toggle="modal" data-target="#market"><i class="far fa-plus-square"></i></button></h1>
=======
<h1  style="text-align: right;">Mercado <button class="botao-invisivel" type="button" data-toggle="modal" data-target="#market"><i class="far fa-plus-square"></i></button></h1>
>>>>>>> master
</div>
  <div class="col-sm-12">
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">Nome da Missão</th>
          <th scope="col">Data Conclusão</th>
          <th scope="col">Quantidade</th>
          <th scope="col">Descrição</th>
          <th scope="col">N° Chamado</th>
        </tr>
      </thead>

      <tbody>
        <?php foreach ($tarefas as $tar){ ?>  
          <tr>
            <td><?= $tar->name_task; ?></td>
            <td><?= $tar->data_conclusao; ?></td>
            <td><?= $tar->quantidade; ?></td>
            <td><?= $tar->descricao; ?></td>
            <td><?= $tar->n_chamado; ?></td>
          </td>
          </tr>
        <?php }?>
      </tbody>
    </table>
  </div>

