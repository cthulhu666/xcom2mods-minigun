class X2AbilityMinigun extends X2Ability
  dependson (XComGameStateContext_Ability) config(Minigun);

// ***** Mobility bonuses
var config int MINIGUN_CONVENTIONAL_MOBILITY_DRAWBACK;
var config int MINIGUN_MAGNETIC_MOBILITY_DRAWBACK;
var config int MINIGUN_BEAM_MOBILITY_DRAWBACK;

/// <summary>
/// Creates the abilities that add passive Mobility for SMGs
/// </summary>
static function array<X2DataTemplate> CreateTemplates()
{
  local array<X2DataTemplate> Templates;

  Templates.AddItem(AddMinigunConventionalBonusAbility());
  //Templates.AddItem(AddMinigunMagneticBonusAbility());
  //Templates.AddItem(AddMinigunBeamBonusAbility());

  return Templates;
}

// ******************* Stat Bonuses **********************

static function X2AbilityTemplate AddMinigunConventionalBonusAbility()
{
  local X2AbilityTemplate                 Template;
  local X2Effect_PersistentStatChange   PersistentStatChangeEffect;

  `CREATE_X2ABILITY_TEMPLATE(Template, 'MINIGUN_CV_StatBonus');
  Template.IconImage = "img:///gfxXComIcons.NanofiberVest";  // TODO : replace with SMG Bonus HP icon? may not need, since icon is hidden

  Template.AbilitySourceName = 'eAbilitySource_Item';
  Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
  Template.Hostility = eHostility_Neutral;
  Template.bDisplayInUITacticalText = false;
 
  Template.AbilityToHitCalc = default.DeadEye;
  Template.AbilityTargetStyle = default.SelfTarget;
  Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
 
  // Bonus to Mobility and DetectionRange stat effects
  PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
  PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
  PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
  PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -default.MINIGUN_CONVENTIONAL_MOBILITY_DRAWBACK);
  //PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.SMG_CONVENTIONAL_DETECTIONRADIUSMODIFER);
  Template.AddTargetEffect(PersistentStatChangeEffect);

  Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

  return Template;
}
