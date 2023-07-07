// The 'lr1' program.
program lr1.aleo {

    record LR_model {
        owner: address,
        slope: i32,
        offset: i32,
    }

    struct Point {
        x: i32,
        y: i32,
    }

    struct TrainingDataset {
        p1: Point,
        p2: Point,
        p3: Point,
        p4: Point,
        p5: Point,
    }

    transition main(ds: TrainingDataset,) -> LR_model {
        let num_points: i32 = 5i32;

        let sum_x: i32 = ds.p1.x + ds.p2.x + ds.p3.x + ds.p4.x + ds.p5.x;
        let sum_y: i32 = ds.p1.y + ds.p2.y + ds.p3.y + ds.p4.y + ds.p5.y;
        let sum_xy: i32 = ds.p1.x * ds.p1.y + ds.p2.x * ds.p2.y + ds.p3.x * ds.p3.y + ds.p4.x * ds.p4.y + ds.p5.x * ds.p5.y;
        let sum_of_squared_x: i32 = ds.p1.x * ds.p1.x + ds.p2.x * ds.p2.x + ds.p3.x * ds.p3.x + ds.p4.x * ds.p4.x + ds.p5.x * ds.p5.x;

        let numerator_m: i32 = num_points * sum_xy - sum_x * sum_y;
        let denominator_m: i32 = num_points * sum_of_squared_x - sum_x * sum_x;
        // compute the slope
        let m: i32 = numerator_m / denominator_m;

        // compute the offset
        let b: i32 = (sum_y - m * sum_x) / num_points;

        return LR_model {
            owner: self.caller,
            slope: m,
            offset: b,
        };
    }

}