import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometryOrdersSurfacesCanonicalLaneLean

structure SurfaceMetricPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  riemannCurvatureTensor : Type w
  ricciTensor : Type x
  scalarCurvature : Type y
  smoothTwoManifold : Prop
  metricSmooth : Prop
  riemannTensorLawful : Prop
  ricciTensorContractedFromRiemann : Prop
  scalarCurvatureTraceOfRicci : Prop

structure SurfaceMetricEvidence (G : SurfaceMetricPackage) where
  smoothTwoManifoldClosed : G.smoothTwoManifold
  metricSmoothClosed : G.metricSmooth
  riemannTensorLawfulClosed : G.riemannTensorLawful
  ricciTensorContractedFromRiemannClosed : G.ricciTensorContractedFromRiemann
  scalarCurvatureTraceOfRicciClosed : G.scalarCurvatureTraceOfRicci

def SurfaceMetricClosed (G : SurfaceMetricPackage) : Prop :=
  G.smoothTwoManifold ∧ G.metricSmooth ∧ G.riemannTensorLawful ∧ G.ricciTensorContractedFromRiemann ∧ G.scalarCurvatureTraceOfRicci

theorem surface_metric_closed_from_evidence
    (G : SurfaceMetricPackage) (E : SurfaceMetricEvidence G) :
    SurfaceMetricClosed G := by
  exact And.intro E.smoothTwoManifoldClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.riemannTensorLawfulClosed
        (And.intro E.ricciTensorContractedFromRiemannClosed
          E.scalarCurvatureTraceOfRicciClosed)))

end GeometryOrdersSurfacesCanonicalLaneLean
end HautevilleHouse