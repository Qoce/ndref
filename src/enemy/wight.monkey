'Strict

Import enemy
Import level
Import audio2
Import camera
Import entity
Import logger
Import player_class
Import point
Import util

Class Wight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()

        Self.Init(xVal, yVal, l, "wight")

        Self.invisible = True
        Self.collides = False
        Self.blink_MIN = 120
        Self.blink_MAX = 240
        Self.blink_DUR = 10

        Self.overrideAttackSound = "wightAttack"
        Self.overrideDeathSound = "wightDeath"

        Self.image.SetZOff(18.0)

        Self.isWraithLike = True

        If Util.IsCharacterActive(Character.Eli)
            Self.coinsToDrop = 0
            Self.Die()
        End If
    End Method

    Field seeking: Bool
    Field hasRoared: Bool

    Method BecomeCorporeal: Void(force: Bool)
        Debug.TraceNotImplemented("Wight.BecomeCorporeal(Bool)")
    End Method

    Method CanBeDamaged: Bool(phasing: Bool, piercing: Bool)
        Debug.TraceNotImplemented("Wight.CanBeDamaged(Bool, Bool)")
    End Method

    Method CheckCorporeality: Void()
        Debug.TraceNotImplemented("Wight.CheckCorporeality()")
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("Wight.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int = Direction.None, hitter: Entity = Null, hitAtLastTile: Bool = False, hitType: Int = 0)
        Debug.TraceNotImplemented("Wight.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Update: Void()
        If Not Self.dead And
           Entity.AnyPlayerHaveNazarCharm()
            Self.coinsToDrop = 0
            Self.Die()
        End If

        If Not Enemy.EnemiesMovingThisFrame()
            Self.CheckCorporeality()
        End If

        If Not Self.invisible And
           Self.IsVisible() And
           Camera.IsOnScreen(Self.x, Self.y) And
           Not Self.hasRoared And
           Not Level.isLevelEditor
            Audio.PlayGameSoundAt("wightCry", Self.x, Self.y, True, -1, False)
            Self.hasRoared = True
        End If

        Super.Update()
    End Method

End Class
