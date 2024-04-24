local conta = io.read()
local numeros = {}
local posicaoDoSinalAtual

while true do
	local eComecoDaExpressao = false

	if not posicaoDoSinalAtual then
		eComecoDaExpressao = true
	end

	if eComecoDaExpressao then
		posicaoDoSinalAtual = string.find(conta, "%p")
	end

	local posicaoDoProximoSinal = string.find(conta, "%p", posicaoDoSinalAtual + 1)
	local eFimDaExpressao = false

	if not posicaoDoProximoSinal and not eComecoDaExpressao then
		posicaoDoProximoSinal = #conta + 1
		eFimDaExpressao = true
	end

	local numero

	if eComecoDaExpressao then
		numero = string.sub(conta, 1, posicaoDoSinalAtual - 1)
	else
		numero = string.sub(conta, posicaoDoSinalAtual + 1, posicaoDoProximoSinal - 1)
		posicaoDoSinalAtual = posicaoDoProximoSinal
	end

	table.insert(numeros, numero)

	if eFimDaExpressao then
		break
	end
end

for key, value in pairs(numeros) do
	print(value)
end