import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure CurvatureOrderPackage where
  surface : Type u
  topology : TopologicalSpace surface
  riemannianMetric : Type v
  curvatureOperator : Type w
  orderRelation : surface → surface → Prop
  curvatureBoundedBelow : Prop
  orderCompatibleWithCurvature : Prop

structure CurvatureOrderEvidence (C : CurvatureOrderPackage) where
  curvatureBoundedBelowClosed : C.curvatureBoundedBelow
  orderCompatibleWithCurvatureClosed : C.orderCompatibleWithCurvature

def CurvatureOrderClosed (C : CurvatureOrderPackage) : Prop :=
  C.curvatureBoundedBelow ∧ C.orderCompatibleWithCurvature

theorem curvature_order_closed_from_evidence (C : CurvatureOrderPackage)
    (E : CurvatureOrderEvidence C) : CurvatureOrderClosed C := by
  exact And.intro E.curvatureBoundedBelowClosed E.orderCompatibleWithCurvatureClosed

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse