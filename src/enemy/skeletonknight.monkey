'Strict

Import monkey.math
Import crystal_shards
Import enemy
Import entity
Import logger
Import point
Import shrine
Import util

Class SkeletonKnight Extends Enemy

    Function _EditorFix: Void() End

    Method New(xVal: Int, yVal: Int, l: Int)
        Super.New()
        
        If Shrine.warShrineActive
            l = math.Max(3, l)
        End If

        Self.Init(xVal, yVal, l, "skeletonknight")

        Self.enableTell = False
        Self.swarmCulprit = True

        Self.overrideHitSound = "skeletonKnightDeath"
        Self.overrideDeathSound = "skeletonKnightDeath"
        Self.overrideAttackSound = "skeletonKnightAttack"
    End Method

    Field hasHead: Bool = True
    Field cachedMoveDir: Point = New Point(0, 0)
    Field directionHitFrom: Int = Direction.None
    Field gotBounced: Bool
    Field hasHorse: Bool = True
    Field shieldDestroyed: Bool
    Field shieldDir: Int = Direction.Down
    Field hasRoared: Bool
    Field justBounced: Bool
    Field willHaveHead: Bool = True

    Method AdjustShieldDir: Void()
        Debug.TraceNotImplemented("SkeletonKnight.AdjustShieldDir()")
    End Method

    Method Beheadable: Bool()
        Debug.TraceNotImplemented("SkeletonKnight.Beheadable()")
    End Method

    Method DestroyHorse: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.DestroyHorse(Int)")
    End Method

    Method DestroyShield: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.DestroyShield(Int)")
    End Method

    Method Die: Void()
        If Self.level = 4
            New CrystalShards(Self.x, Self.y)
        End If

        Super.Die()
    End Method

    Method GetMovementDirection: Point()
        Debug.TraceNotImplemented("SkeletonKnight.GetMovementDirection()")
    End Method

    Method Hit: Bool(damageSource: String, damage: Int, dir: Int, hitter: Entity, hitAtLastTile: Bool, hitType: Int)
        Debug.TraceNotImplemented("SkeletonKnight.Hit(String, Int, Int, Entity, Bool, Int)")
    End Method

    Method Knockback: Void(dir: Int)
        Debug.TraceNotImplemented("SkeletonKnight.Knockback(Int)")
    End Method

    Method MoveFail: Void()
        Debug.TraceNotImplemented("SkeletonKnight.MoveFail()")
    End Method

    Method MoveImmediate: Int(xVal: Int, yVal: Int, movementSource: String)
        Debug.TraceNotImplemented("SkeletonKnight.MoveImmediate(Int, Int, String)")
    End Method

    Method MoveSucceed: Void(hitPlayer: Bool, moveDelayed: Bool)
        Debug.TraceNotImplemented("SkeletonKnight.MoveSucceed(Bool, Bool)")
    End Method

    Method Update: Void()
        Debug.TraceNotImplemented("SkeletonKnight.Update()")
    End Method

End Class
