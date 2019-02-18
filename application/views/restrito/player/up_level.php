<div class="modal fade" id="addTarefa" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Cadastrar Tarefa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form  method="POST" action='<?php echo base_url('upLevel') ?>'> 
      <label for="sel1">Selecione a Missão</label>
        <div class="form-group">
          <select class="form-control" data-toggle="tooltip" name="name_task" id="sel1" required>
          <option><p><p></option>
          <?php foreach ($tasks as $tk){ ?> 
            <option value='<?= $tk->id; ?>' title="Please choose one"><?= $tk->name_task; ?> XP:<?= $tk->xp; ?></option>
          <?php }?>
          </select>
        </div>
        <br>
        <br>
        <div class="form-group">
          <input type="hidden" name="playerid" value="<?php print_r($playerInfo['id']); ?>" class="form-control bfh-number col-sm-3">
          <label for="quantidade">Quantidade</label>
            <input type="text" name="quantidade" class="form-control bfh-number col-sm-3" required>
        </div>
        <div class="form-group">
          <label for="quantidade">N° Chamado</label>
            <input type="text" name="nchamado" class="form-control bfh-number col-sm-3">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-primary">Adicionar</button>
      </div>
      </form>
    </div>
  </div>
</div>