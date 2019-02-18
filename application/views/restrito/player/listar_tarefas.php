<div class="col-sm-12">
  <h1>Tarefas <button class="botao-invisivel" type="button" data-toggle="modal" data-target="#addTarefa"><i class="far fa-plus-square"></i></button></h1>
  <div class="col-sm-12">
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">Nome da Missão</th>
          <th scope="col">Data Conclusão</th>
          <th scope="col">Quantidade/Vezes Efetuada</th>
          <th scope="col">N° Chamado</th>
        </tr>
      </thead>

      <tbody>
        <?php foreach ($tarefas as $tar){ ?>  
          <tr>
            <td><?= $tar->name_task; ?></td>
            <td><?= $tar->data_conclusao; ?></td>
            <td><?= $tar->quantidade; ?></td>
            <td><?= $tar->n_chamado; ?></td>
          </td>
          </tr>
        <?php }?>
      </tbody>
    </table>
  </div>
</div>
