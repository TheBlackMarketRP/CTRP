_, Sup.CIA = AddRelationshipGroup("Sup.CIA")
Sup.Peds = {}
SetRelationshipBetweenGroups(1, Sup.CIA, GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), Sup.CIA)

CreateThread(function()

    Sup.UUID = Callback.TriggerServerCallback("Sup:ILikePotatoesYouKnowWhyMeNo")
    Sup.Init()
end)

function Sup.Init()
    Sup.Peds = Callback.TriggerServerCallback("Sup:GetPeds", Sup.UUID)

    for i = 1, #Sup.Peds do
        Sup.Peds[i] = NetToEnt(Sup.Peds[i])
    end
    for i = 1, #Sup.Peds do
        SetPedRelationshipGroupHash(Sup.Peds[i], Sup.CIA)
    end

end
