class X2ItemMinigun extends X2Item config(Minigun);

var config WeaponDamageValue MINIGUN_CONVENTIONAL_BASEDAMAGE;

var config int MINIGUN_CONVENTIONAL_AIM;
var config int MINIGUN_CONVENTIONAL_CRITCHANCE;
var config int MINIGUN_CONVENTIONAL_ICLIPSIZE;
var config int MINIGUN_CONVENTIONAL_ISOUNDRANGE;
var config int MINIGUN_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int MINIGUN_CONVENTIONAL_ISUPPLIES;
var config int MINIGUN_CONVENTIONAL_TRADINGPOSTVALUE;
var config int MINIGUN_CONVENTIONAL_IPOINTS;

var config array<int> MEDIUM_CONVENTIONAL_RANGE;
var config array<int> MEDIUM_MAGNETIC_RANGE;
var config array<int> MEDIUM_BEAM_RANGE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	
	Weapons.AddItem(CreateTemplate_Minigun_Conventional());

	return Weapons;
}

static function X2DataTemplate CreateTemplate_Minigun_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Minigun_CV');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvCannon.ConvCannon_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.RangeAccuracy = default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.MINIGUN_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.MINIGUN_CONVENTIONAL_AIM;
	Template.CritChance = default.MINIGUN_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.MINIGUN_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.MINIGUN_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MINIGUN_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 1;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.Abilities.AddItem('MINIGUN_CV_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -class'X2AbilityMinigun'.default.MINIGUN_CONVENTIONAL_MOBILITY_DRAWBACK);

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Cannon_CV.WP_Cannon_CV";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.UpgradeItem = 'Cannon_MG';

	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}
