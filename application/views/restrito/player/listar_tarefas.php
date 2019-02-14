<div class="col-sm-12">
  <h1>Tarefas <a href="#"><i class="far fa-plus-square"></i></a></h1>
  <div class="col-sm-12">
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">Nome da Missão</th>
          <th scope="col">Data Conclusão</th>
          <th scope="col">Quantidade/Vezes Efetuada</th>
          <th scope="col">N° Chamado</th>
          <th scope="col">Ações</th>
        </tr>
      </thead>

      <tbody>
        <?php foreach ($tarefas as $tar){ ?>  
          <tr>
            <td><?= $tar->name_task; ?></td>
            <td><?= $tar->data_conclusao; ?></td>
            <td><?= $tar->quantidade; ?></td>
            <td><?= $tar->n_chamado; ?></td>
            <td>
            <a href="#"><button type='button' class='btn btn-primary btn-sm'>Atualizar</button></a> 
          </td>
          </tr>
        <?php }?>
      </tbody>
    </table>
  </div>
</div>