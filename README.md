# REGRAS
# id, valor, mesma_titularidade, bank_id, criação_da_conta_benificiaria, 2_fa, benificiario_tem_2_fa, valor_transacionado_no_dia, transações_feitas_no_dia, data_da_ultima_transacao_para_esse_cliente

transaction = UserTransaction.first
user = transaction.user
benificiary_account = transaction.beneficiary_account
benificiary = beneficiary_account.user


return false if benificiary == user
return true unless user.2_fa
if user.2_fa
  return true if bank_id == 1 && benificiary.2_fa == false
  return true if valor > 100
  return true if (valor_transacionado + valor) > 2000
  return true if transações_para_benifiario_na_ultima_hora > 5
end


Se a transação for de mesma titularidade não é fraude
Se o 2_fa está desabilitado é fraude
Se o usuário ter o 2_fa habilitado:
  - se o banco ter codigo 1 e o benificiario não ter 2_fa é fraude
  - se o valor for maior que 100 é fraude
  - se o valor transacionado no dia mais o valor for maior que 2k é fraude
  - se o número de transações feitas para esse benificiario for maior que 5 na última hora é fraude