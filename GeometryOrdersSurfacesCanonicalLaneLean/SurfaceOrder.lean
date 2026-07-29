import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure SurfaceOrderPackage (A : AdmissibleClass) where
  surfaceCarrier : Type u
  orderRelation : surfaceCarrier → surfaceCarrier → Prop
  orderProperties : Prop
  surfaceTopology : TopologicalSpace surfaceCarrier
  orderCompatible : Prop

structure SurfaceOrderEvidence {A : AdmissibleClass} (P : SurfaceOrderPackage A) where
  orderPropertiesClosed : P.orderProperties
  orderCompatibleClosed : P.orderCompatible

def SurfaceOrderClosed {A : AdmissibleClass} (P : SurfaceOrderPackage A) : Prop :=
  P.orderProperties ∧ P.orderCompatible

theorem surface_order_closed_from_evidence {A : AdmissibleClass} (P : SurfaceOrderPackage A)
    (E : SurfaceOrderEvidence P) : SurfaceOrderClosed P := by
  exact And.intro E.orderPropertiesClosed E.orderCompatibleClosed

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse