program lr1.aleo {
    record LR_model {
        owner: address,
        slope: i64,
        offset: i64,
    }

    struct Point {
        x: i64,
        y: i64,
    }

    struct TrainingDataset {
        p0: Point,
        p1: Point,
        p2: Point,
        p3: Point,
        p4: Point,
        p5: Point,
        p6: Point,
        p7: Point,
        p8: Point,
        p9: Point,
        p10: Point,
        p11: Point,
        p12: Point,
        p13: Point,
        p14: Point,
        p15: Point,
    }

    struct TrainingDatasetCollection {
        td0: TrainingDataset,
    }

    transition main(dsc: TrainingDatasetCollection) -> LR_model {
        let num_points: i64 = 16i64;
        let sum_x: i64 = dsc.td0.p0.x + dsc.td0.p1.x + dsc.td0.p2.x + dsc.td0.p3.x + dsc.td0.p4.x + dsc.td0.p5.x + dsc.td0.p6.x + dsc.td0.p7.x + dsc.td0.p8.x + dsc.td0.p9.x + dsc.td0.p10.x + dsc.td0.p11.x + dsc.td0.p12.x + dsc.td0.p13.x + dsc.td0.p14.x + dsc.td0.p15.x;
        let sum_y: i64 = dsc.td0.p0.y + dsc.td0.p1.y + dsc.td0.p2.y + dsc.td0.p3.y + dsc.td0.p4.y + dsc.td0.p5.y + dsc.td0.p6.y + dsc.td0.p7.y + dsc.td0.p8.y + dsc.td0.p9.y + dsc.td0.p10.y + dsc.td0.p11.y + dsc.td0.p12.y + dsc.td0.p13.y + dsc.td0.p14.y + dsc.td0.p15.y;
        let sum_xy: i64 = dsc.td0.p0.x * dsc.td0.p0.y + dsc.td0.p1.x * dsc.td0.p1.y + dsc.td0.p2.x * dsc.td0.p2.y + dsc.td0.p3.x * dsc.td0.p3.y + dsc.td0.p4.x * dsc.td0.p4.y + dsc.td0.p5.x * dsc.td0.p5.y + dsc.td0.p6.x * dsc.td0.p6.y + dsc.td0.p7.x * dsc.td0.p7.y + dsc.td0.p8.x * dsc.td0.p8.y + dsc.td0.p9.x * dsc.td0.p9.y + dsc.td0.p10.x * dsc.td0.p10.y + dsc.td0.p11.x * dsc.td0.p11.y + dsc.td0.p12.x * dsc.td0.p12.y + dsc.td0.p13.x * dsc.td0.p13.y + dsc.td0.p14.x * dsc.td0.p14.y + dsc.td0.p15.x * dsc.td0.p15.y;
        let sum_of_squared_x: i64 = dsc.td0.p0.x * dsc.td0.p0.x + dsc.td0.p1.x * dsc.td0.p1.x + dsc.td0.p2.x * dsc.td0.p2.x + dsc.td0.p3.x * dsc.td0.p3.x + dsc.td0.p4.x * dsc.td0.p4.x + dsc.td0.p5.x * dsc.td0.p5.x + dsc.td0.p6.x * dsc.td0.p6.x + dsc.td0.p7.x * dsc.td0.p7.x + dsc.td0.p8.x * dsc.td0.p8.x + dsc.td0.p9.x * dsc.td0.p9.x + dsc.td0.p10.x * dsc.td0.p10.x + dsc.td0.p11.x * dsc.td0.p11.x + dsc.td0.p12.x * dsc.td0.p12.x + dsc.td0.p13.x * dsc.td0.p13.x + dsc.td0.p14.x * dsc.td0.p14.x + dsc.td0.p15.x * dsc.td0.p15.x;

        let numerator_m: i64 = num_points * sum_xy - sum_x * sum_y;
        let denominator_m: i64 = num_points * sum_of_squared_x - sum_x * sum_x;
        let m: i64 = numerator_m / denominator_m;
        let b: i64 = (sum_y - m * sum_x) / num_points;

        return LR_model {
            owner: self.caller,
            slope: m,
            offset: b,
        };
    }

}