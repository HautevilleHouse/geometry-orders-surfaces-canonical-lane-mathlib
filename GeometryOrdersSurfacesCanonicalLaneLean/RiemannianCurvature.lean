import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure SurfaceCurvaturePackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  gaussCurvature : Type w
  meanCurvature : Type x
  shapeOperator : Type y
  smoothTwoManifold : Prop
  metricSmooth : Prop
  gaussCurvatureFromShapeOp : Prop
  meanCurvatureFromShapeOp : Prop
  shapeOperatorSelfAdjoint : Prop

structure SurfaceCurvatureEvidence (C : SurfaceCurvaturePackage) where
  smoothTwoManifoldClosed : C.smoothTwoManifold
  metricSmoothClosed : C.metricSmooth
  gaussCurvatureFromShapeOpClosed : C.gaussCurvatureFromShapeOp
  meanCurvatureFromShapeOpClosed : C.meanCurvatureFromShapeOp
  shapeOperatorSelfAdjointClosed : C.shapeOperatorSelfAdjoint

def SurfaceCurvatureClosed (C : SurfaceCurvaturePackage) : Prop :=
  C.smoothTwoManifold ∧ C.metricSmooth ∧ C.gaussCurvatureFromShapeOp ∧ C.meanCurvatureFromShapeOp ∧ C.shapeOperatorSelfAdjoint

theorem surface_curvature_closed_from_evidence (C : SurfaceCurvaturePackage) (E : SurfaceCurvatureEvidence C) :
    SurfaceCurvatureClosed C := by
  exact And.intro E.smoothTwoManifoldClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.gaussCurvatureFromShapeOpClosed
        (And.intro E.meanCurvatureFromShapeOpClosed E.shapeOperatorSelfAdjointClosed)))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse