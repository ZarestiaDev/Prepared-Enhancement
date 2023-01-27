function onInit()
    if super and super.onInit then
        super.onInit();
    end

    local node = DB.getChild(getDatabaseNode(), "...");
    DB.addHandler(DB.getPath(node, "level"), "onUpdate", cyclerChanged);
	DB.addHandler(DB.getPath(node, "abilities.*.score"), "onUpdate", cyclerChanged);
end

function onClose()
    local node = DB.getChild(getDatabaseNode(), "...");
    DB.removeHandler(DB.getPath(node, "level"), "onUpdate", cyclerChanged);
	DB.removeHandler(DB.getPath(node, "abilities.*.score"), "onUpdate", cyclerChanged);
end

function cyclerChanged()
    local nodeChar = getDatabaseNode();
    local rActor = DB.getChild(nodeChar, "...");
    local sAbility = DB.getValue(nodeChar, "preparedmod", "");
    local nAbilityBonus = ActorManager5E.getAbilityBonus(rActor, sAbility);

    prepared.setValue(nAbilityBonus);
end

function cyclerVisible(bPrep)
    preparedmod.setVisible(bPrep);
end
