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
        p16: Point,
        p17: Point,
        p18: Point,
        p19: Point,
        p20: Point,
        p21: Point,
        p22: Point,
        p23: Point,
        p24: Point,
        p25: Point,
        p26: Point,
        p27: Point,
        p28: Point,
        p29: Point,
        p30: Point,
        p31: Point,
    }

    struct TrainingDatasetCollection {
        td0: TrainingDataset,
        td1: TrainingDataset,
        td2: TrainingDataset,
        td3: TrainingDataset,
    }

    transition main(dsc: TrainingDatasetCollection) -> LR_model {
        let num_points: i64 = 128i64;
        let sum_x: i64 = dsc.td0.p0.x + dsc.td0.p1.x + dsc.td0.p2.x + dsc.td0.p3.x + dsc.td0.p4.x + dsc.td0.p5.x + dsc.td0.p6.x + dsc.td0.p7.x + dsc.td0.p8.x + dsc.td0.p9.x + dsc.td0.p10.x + dsc.td0.p11.x + dsc.td0.p12.x + dsc.td0.p13.x + dsc.td0.p14.x + dsc.td0.p15.x + dsc.td0.p16.x + dsc.td0.p17.x + dsc.td0.p18.x + dsc.td0.p19.x + dsc.td0.p20.x + dsc.td0.p21.x + dsc.td0.p22.x + dsc.td0.p23.x + dsc.td0.p24.x + dsc.td0.p25.x + dsc.td0.p26.x + dsc.td0.p27.x + dsc.td0.p28.x + dsc.td0.p29.x + dsc.td0.p30.x + dsc.td0.p31.x + dsc.td1.p0.x + dsc.td1.p1.x + dsc.td1.p2.x + dsc.td1.p3.x + dsc.td1.p4.x + dsc.td1.p5.x + dsc.td1.p6.x + dsc.td1.p7.x + dsc.td1.p8.x + dsc.td1.p9.x + dsc.td1.p10.x + dsc.td1.p11.x + dsc.td1.p12.x + dsc.td1.p13.x + dsc.td1.p14.x + dsc.td1.p15.x + dsc.td1.p16.x + dsc.td1.p17.x + dsc.td1.p18.x + dsc.td1.p19.x + dsc.td1.p20.x + dsc.td1.p21.x + dsc.td1.p22.x + dsc.td1.p23.x + dsc.td1.p24.x + dsc.td1.p25.x + dsc.td1.p26.x + dsc.td1.p27.x + dsc.td1.p28.x + dsc.td1.p29.x + dsc.td1.p30.x + dsc.td1.p31.x + dsc.td2.p0.x + dsc.td2.p1.x + dsc.td2.p2.x + dsc.td2.p3.x + dsc.td2.p4.x + dsc.td2.p5.x + dsc.td2.p6.x + dsc.td2.p7.x + dsc.td2.p8.x + dsc.td2.p9.x + dsc.td2.p10.x + dsc.td2.p11.x + dsc.td2.p12.x + dsc.td2.p13.x + dsc.td2.p14.x + dsc.td2.p15.x + dsc.td2.p16.x + dsc.td2.p17.x + dsc.td2.p18.x + dsc.td2.p19.x + dsc.td2.p20.x + dsc.td2.p21.x + dsc.td2.p22.x + dsc.td2.p23.x + dsc.td2.p24.x + dsc.td2.p25.x + dsc.td2.p26.x + dsc.td2.p27.x + dsc.td2.p28.x + dsc.td2.p29.x + dsc.td2.p30.x + dsc.td2.p31.x + dsc.td3.p0.x + dsc.td3.p1.x + dsc.td3.p2.x + dsc.td3.p3.x + dsc.td3.p4.x + dsc.td3.p5.x + dsc.td3.p6.x + dsc.td3.p7.x + dsc.td3.p8.x + dsc.td3.p9.x + dsc.td3.p10.x + dsc.td3.p11.x + dsc.td3.p12.x + dsc.td3.p13.x + dsc.td3.p14.x + dsc.td3.p15.x + dsc.td3.p16.x + dsc.td3.p17.x + dsc.td3.p18.x + dsc.td3.p19.x + dsc.td3.p20.x + dsc.td3.p21.x + dsc.td3.p22.x + dsc.td3.p23.x + dsc.td3.p24.x + dsc.td3.p25.x + dsc.td3.p26.x + dsc.td3.p27.x + dsc.td3.p28.x + dsc.td3.p29.x + dsc.td3.p30.x + dsc.td3.p31.x;
        let sum_y: i64 = dsc.td0.p0.y + dsc.td0.p1.y + dsc.td0.p2.y + dsc.td0.p3.y + dsc.td0.p4.y + dsc.td0.p5.y + dsc.td0.p6.y + dsc.td0.p7.y + dsc.td0.p8.y + dsc.td0.p9.y + dsc.td0.p10.y + dsc.td0.p11.y + dsc.td0.p12.y + dsc.td0.p13.y + dsc.td0.p14.y + dsc.td0.p15.y + dsc.td0.p16.y + dsc.td0.p17.y + dsc.td0.p18.y + dsc.td0.p19.y + dsc.td0.p20.y + dsc.td0.p21.y + dsc.td0.p22.y + dsc.td0.p23.y + dsc.td0.p24.y + dsc.td0.p25.y + dsc.td0.p26.y + dsc.td0.p27.y + dsc.td0.p28.y + dsc.td0.p29.y + dsc.td0.p30.y + dsc.td0.p31.y + dsc.td1.p0.y + dsc.td1.p1.y + dsc.td1.p2.y + dsc.td1.p3.y + dsc.td1.p4.y + dsc.td1.p5.y + dsc.td1.p6.y + dsc.td1.p7.y + dsc.td1.p8.y + dsc.td1.p9.y + dsc.td1.p10.y + dsc.td1.p11.y + dsc.td1.p12.y + dsc.td1.p13.y + dsc.td1.p14.y + dsc.td1.p15.y + dsc.td1.p16.y + dsc.td1.p17.y + dsc.td1.p18.y + dsc.td1.p19.y + dsc.td1.p20.y + dsc.td1.p21.y + dsc.td1.p22.y + dsc.td1.p23.y + dsc.td1.p24.y + dsc.td1.p25.y + dsc.td1.p26.y + dsc.td1.p27.y + dsc.td1.p28.y + dsc.td1.p29.y + dsc.td1.p30.y + dsc.td1.p31.y + dsc.td2.p0.y + dsc.td2.p1.y + dsc.td2.p2.y + dsc.td2.p3.y + dsc.td2.p4.y + dsc.td2.p5.y + dsc.td2.p6.y + dsc.td2.p7.y + dsc.td2.p8.y + dsc.td2.p9.y + dsc.td2.p10.y + dsc.td2.p11.y + dsc.td2.p12.y + dsc.td2.p13.y + dsc.td2.p14.y + dsc.td2.p15.y + dsc.td2.p16.y + dsc.td2.p17.y + dsc.td2.p18.y + dsc.td2.p19.y + dsc.td2.p20.y + dsc.td2.p21.y + dsc.td2.p22.y + dsc.td2.p23.y + dsc.td2.p24.y + dsc.td2.p25.y + dsc.td2.p26.y + dsc.td2.p27.y + dsc.td2.p28.y + dsc.td2.p29.y + dsc.td2.p30.y + dsc.td2.p31.y + dsc.td3.p0.y + dsc.td3.p1.y + dsc.td3.p2.y + dsc.td3.p3.y + dsc.td3.p4.y + dsc.td3.p5.y + dsc.td3.p6.y + dsc.td3.p7.y + dsc.td3.p8.y + dsc.td3.p9.y + dsc.td3.p10.y + dsc.td3.p11.y + dsc.td3.p12.y + dsc.td3.p13.y + dsc.td3.p14.y + dsc.td3.p15.y + dsc.td3.p16.y + dsc.td3.p17.y + dsc.td3.p18.y + dsc.td3.p19.y + dsc.td3.p20.y + dsc.td3.p21.y + dsc.td3.p22.y + dsc.td3.p23.y + dsc.td3.p24.y + dsc.td3.p25.y + dsc.td3.p26.y + dsc.td3.p27.y + dsc.td3.p28.y + dsc.td3.p29.y + dsc.td3.p30.y + dsc.td3.p31.y;
        let sum_xy: i64 = dsc.td0.p0.x * dsc.td0.p0.y + dsc.td0.p1.x * dsc.td0.p1.y + dsc.td0.p2.x * dsc.td0.p2.y + dsc.td0.p3.x * dsc.td0.p3.y + dsc.td0.p4.x * dsc.td0.p4.y + dsc.td0.p5.x * dsc.td0.p5.y + dsc.td0.p6.x * dsc.td0.p6.y + dsc.td0.p7.x * dsc.td0.p7.y + dsc.td0.p8.x * dsc.td0.p8.y + dsc.td0.p9.x * dsc.td0.p9.y + dsc.td0.p10.x * dsc.td0.p10.y + dsc.td0.p11.x * dsc.td0.p11.y + dsc.td0.p12.x * dsc.td0.p12.y + dsc.td0.p13.x * dsc.td0.p13.y + dsc.td0.p14.x * dsc.td0.p14.y + dsc.td0.p15.x * dsc.td0.p15.y + dsc.td0.p16.x * dsc.td0.p16.y + dsc.td0.p17.x * dsc.td0.p17.y + dsc.td0.p18.x * dsc.td0.p18.y + dsc.td0.p19.x * dsc.td0.p19.y + dsc.td0.p20.x * dsc.td0.p20.y + dsc.td0.p21.x * dsc.td0.p21.y + dsc.td0.p22.x * dsc.td0.p22.y + dsc.td0.p23.x * dsc.td0.p23.y + dsc.td0.p24.x * dsc.td0.p24.y + dsc.td0.p25.x * dsc.td0.p25.y + dsc.td0.p26.x * dsc.td0.p26.y + dsc.td0.p27.x * dsc.td0.p27.y + dsc.td0.p28.x * dsc.td0.p28.y + dsc.td0.p29.x * dsc.td0.p29.y + dsc.td0.p30.x * dsc.td0.p30.y + dsc.td0.p31.x * dsc.td0.p31.y + dsc.td1.p0.x * dsc.td1.p0.y + dsc.td1.p1.x * dsc.td1.p1.y + dsc.td1.p2.x * dsc.td1.p2.y + dsc.td1.p3.x * dsc.td1.p3.y + dsc.td1.p4.x * dsc.td1.p4.y + dsc.td1.p5.x * dsc.td1.p5.y + dsc.td1.p6.x * dsc.td1.p6.y + dsc.td1.p7.x * dsc.td1.p7.y + dsc.td1.p8.x * dsc.td1.p8.y + dsc.td1.p9.x * dsc.td1.p9.y + dsc.td1.p10.x * dsc.td1.p10.y + dsc.td1.p11.x * dsc.td1.p11.y + dsc.td1.p12.x * dsc.td1.p12.y + dsc.td1.p13.x * dsc.td1.p13.y + dsc.td1.p14.x * dsc.td1.p14.y + dsc.td1.p15.x * dsc.td1.p15.y + dsc.td1.p16.x * dsc.td1.p16.y + dsc.td1.p17.x * dsc.td1.p17.y + dsc.td1.p18.x * dsc.td1.p18.y + dsc.td1.p19.x * dsc.td1.p19.y + dsc.td1.p20.x * dsc.td1.p20.y + dsc.td1.p21.x * dsc.td1.p21.y + dsc.td1.p22.x * dsc.td1.p22.y + dsc.td1.p23.x * dsc.td1.p23.y + dsc.td1.p24.x * dsc.td1.p24.y + dsc.td1.p25.x * dsc.td1.p25.y + dsc.td1.p26.x * dsc.td1.p26.y + dsc.td1.p27.x * dsc.td1.p27.y + dsc.td1.p28.x * dsc.td1.p28.y + dsc.td1.p29.x * dsc.td1.p29.y + dsc.td1.p30.x * dsc.td1.p30.y + dsc.td1.p31.x * dsc.td1.p31.y + dsc.td2.p0.x * dsc.td2.p0.y + dsc.td2.p1.x * dsc.td2.p1.y + dsc.td2.p2.x * dsc.td2.p2.y + dsc.td2.p3.x * dsc.td2.p3.y + dsc.td2.p4.x * dsc.td2.p4.y + dsc.td2.p5.x * dsc.td2.p5.y + dsc.td2.p6.x * dsc.td2.p6.y + dsc.td2.p7.x * dsc.td2.p7.y + dsc.td2.p8.x * dsc.td2.p8.y + dsc.td2.p9.x * dsc.td2.p9.y + dsc.td2.p10.x * dsc.td2.p10.y + dsc.td2.p11.x * dsc.td2.p11.y + dsc.td2.p12.x * dsc.td2.p12.y + dsc.td2.p13.x * dsc.td2.p13.y + dsc.td2.p14.x * dsc.td2.p14.y + dsc.td2.p15.x * dsc.td2.p15.y + dsc.td2.p16.x * dsc.td2.p16.y + dsc.td2.p17.x * dsc.td2.p17.y + dsc.td2.p18.x * dsc.td2.p18.y + dsc.td2.p19.x * dsc.td2.p19.y + dsc.td2.p20.x * dsc.td2.p20.y + dsc.td2.p21.x * dsc.td2.p21.y + dsc.td2.p22.x * dsc.td2.p22.y + dsc.td2.p23.x * dsc.td2.p23.y + dsc.td2.p24.x * dsc.td2.p24.y + dsc.td2.p25.x * dsc.td2.p25.y + dsc.td2.p26.x * dsc.td2.p26.y + dsc.td2.p27.x * dsc.td2.p27.y + dsc.td2.p28.x * dsc.td2.p28.y + dsc.td2.p29.x * dsc.td2.p29.y + dsc.td2.p30.x * dsc.td2.p30.y + dsc.td2.p31.x * dsc.td2.p31.y + dsc.td3.p0.x * dsc.td3.p0.y + dsc.td3.p1.x * dsc.td3.p1.y + dsc.td3.p2.x * dsc.td3.p2.y + dsc.td3.p3.x * dsc.td3.p3.y + dsc.td3.p4.x * dsc.td3.p4.y + dsc.td3.p5.x * dsc.td3.p5.y + dsc.td3.p6.x * dsc.td3.p6.y + dsc.td3.p7.x * dsc.td3.p7.y + dsc.td3.p8.x * dsc.td3.p8.y + dsc.td3.p9.x * dsc.td3.p9.y + dsc.td3.p10.x * dsc.td3.p10.y + dsc.td3.p11.x * dsc.td3.p11.y + dsc.td3.p12.x * dsc.td3.p12.y + dsc.td3.p13.x * dsc.td3.p13.y + dsc.td3.p14.x * dsc.td3.p14.y + dsc.td3.p15.x * dsc.td3.p15.y + dsc.td3.p16.x * dsc.td3.p16.y + dsc.td3.p17.x * dsc.td3.p17.y + dsc.td3.p18.x * dsc.td3.p18.y + dsc.td3.p19.x * dsc.td3.p19.y + dsc.td3.p20.x * dsc.td3.p20.y + dsc.td3.p21.x * dsc.td3.p21.y + dsc.td3.p22.x * dsc.td3.p22.y + dsc.td3.p23.x * dsc.td3.p23.y + dsc.td3.p24.x * dsc.td3.p24.y + dsc.td3.p25.x * dsc.td3.p25.y + dsc.td3.p26.x * dsc.td3.p26.y + dsc.td3.p27.x * dsc.td3.p27.y + dsc.td3.p28.x * dsc.td3.p28.y + dsc.td3.p29.x * dsc.td3.p29.y + dsc.td3.p30.x * dsc.td3.p30.y + dsc.td3.p31.x * dsc.td3.p31.y;
        let sum_of_squared_x: i64 = dsc.td0.p0.x * dsc.td0.p0.x + dsc.td0.p1.x * dsc.td0.p1.x + dsc.td0.p2.x * dsc.td0.p2.x + dsc.td0.p3.x * dsc.td0.p3.x + dsc.td0.p4.x * dsc.td0.p4.x + dsc.td0.p5.x * dsc.td0.p5.x + dsc.td0.p6.x * dsc.td0.p6.x + dsc.td0.p7.x * dsc.td0.p7.x + dsc.td0.p8.x * dsc.td0.p8.x + dsc.td0.p9.x * dsc.td0.p9.x + dsc.td0.p10.x * dsc.td0.p10.x + dsc.td0.p11.x * dsc.td0.p11.x + dsc.td0.p12.x * dsc.td0.p12.x + dsc.td0.p13.x * dsc.td0.p13.x + dsc.td0.p14.x * dsc.td0.p14.x + dsc.td0.p15.x * dsc.td0.p15.x + dsc.td0.p16.x * dsc.td0.p16.x + dsc.td0.p17.x * dsc.td0.p17.x + dsc.td0.p18.x * dsc.td0.p18.x + dsc.td0.p19.x * dsc.td0.p19.x + dsc.td0.p20.x * dsc.td0.p20.x + dsc.td0.p21.x * dsc.td0.p21.x + dsc.td0.p22.x * dsc.td0.p22.x + dsc.td0.p23.x * dsc.td0.p23.x + dsc.td0.p24.x * dsc.td0.p24.x + dsc.td0.p25.x * dsc.td0.p25.x + dsc.td0.p26.x * dsc.td0.p26.x + dsc.td0.p27.x * dsc.td0.p27.x + dsc.td0.p28.x * dsc.td0.p28.x + dsc.td0.p29.x * dsc.td0.p29.x + dsc.td0.p30.x * dsc.td0.p30.x + dsc.td0.p31.x * dsc.td0.p31.x + dsc.td1.p0.x * dsc.td1.p0.x + dsc.td1.p1.x * dsc.td1.p1.x + dsc.td1.p2.x * dsc.td1.p2.x + dsc.td1.p3.x * dsc.td1.p3.x + dsc.td1.p4.x * dsc.td1.p4.x + dsc.td1.p5.x * dsc.td1.p5.x + dsc.td1.p6.x * dsc.td1.p6.x + dsc.td1.p7.x * dsc.td1.p7.x + dsc.td1.p8.x * dsc.td1.p8.x + dsc.td1.p9.x * dsc.td1.p9.x + dsc.td1.p10.x * dsc.td1.p10.x + dsc.td1.p11.x * dsc.td1.p11.x + dsc.td1.p12.x * dsc.td1.p12.x + dsc.td1.p13.x * dsc.td1.p13.x + dsc.td1.p14.x * dsc.td1.p14.x + dsc.td1.p15.x * dsc.td1.p15.x + dsc.td1.p16.x * dsc.td1.p16.x + dsc.td1.p17.x * dsc.td1.p17.x + dsc.td1.p18.x * dsc.td1.p18.x + dsc.td1.p19.x * dsc.td1.p19.x + dsc.td1.p20.x * dsc.td1.p20.x + dsc.td1.p21.x * dsc.td1.p21.x + dsc.td1.p22.x * dsc.td1.p22.x + dsc.td1.p23.x * dsc.td1.p23.x + dsc.td1.p24.x * dsc.td1.p24.x + dsc.td1.p25.x * dsc.td1.p25.x + dsc.td1.p26.x * dsc.td1.p26.x + dsc.td1.p27.x * dsc.td1.p27.x + dsc.td1.p28.x * dsc.td1.p28.x + dsc.td1.p29.x * dsc.td1.p29.x + dsc.td1.p30.x * dsc.td1.p30.x + dsc.td1.p31.x * dsc.td1.p31.x + dsc.td2.p0.x * dsc.td2.p0.x + dsc.td2.p1.x * dsc.td2.p1.x + dsc.td2.p2.x * dsc.td2.p2.x + dsc.td2.p3.x * dsc.td2.p3.x + dsc.td2.p4.x * dsc.td2.p4.x + dsc.td2.p5.x * dsc.td2.p5.x + dsc.td2.p6.x * dsc.td2.p6.x + dsc.td2.p7.x * dsc.td2.p7.x + dsc.td2.p8.x * dsc.td2.p8.x + dsc.td2.p9.x * dsc.td2.p9.x + dsc.td2.p10.x * dsc.td2.p10.x + dsc.td2.p11.x * dsc.td2.p11.x + dsc.td2.p12.x * dsc.td2.p12.x + dsc.td2.p13.x * dsc.td2.p13.x + dsc.td2.p14.x * dsc.td2.p14.x + dsc.td2.p15.x * dsc.td2.p15.x + dsc.td2.p16.x * dsc.td2.p16.x + dsc.td2.p17.x * dsc.td2.p17.x + dsc.td2.p18.x * dsc.td2.p18.x + dsc.td2.p19.x * dsc.td2.p19.x + dsc.td2.p20.x * dsc.td2.p20.x + dsc.td2.p21.x * dsc.td2.p21.x + dsc.td2.p22.x * dsc.td2.p22.x + dsc.td2.p23.x * dsc.td2.p23.x + dsc.td2.p24.x * dsc.td2.p24.x + dsc.td2.p25.x * dsc.td2.p25.x + dsc.td2.p26.x * dsc.td2.p26.x + dsc.td2.p27.x * dsc.td2.p27.x + dsc.td2.p28.x * dsc.td2.p28.x + dsc.td2.p29.x * dsc.td2.p29.x + dsc.td2.p30.x * dsc.td2.p30.x + dsc.td2.p31.x * dsc.td2.p31.x + dsc.td3.p0.x * dsc.td3.p0.x + dsc.td3.p1.x * dsc.td3.p1.x + dsc.td3.p2.x * dsc.td3.p2.x + dsc.td3.p3.x * dsc.td3.p3.x + dsc.td3.p4.x * dsc.td3.p4.x + dsc.td3.p5.x * dsc.td3.p5.x + dsc.td3.p6.x * dsc.td3.p6.x + dsc.td3.p7.x * dsc.td3.p7.x + dsc.td3.p8.x * dsc.td3.p8.x + dsc.td3.p9.x * dsc.td3.p9.x + dsc.td3.p10.x * dsc.td3.p10.x + dsc.td3.p11.x * dsc.td3.p11.x + dsc.td3.p12.x * dsc.td3.p12.x + dsc.td3.p13.x * dsc.td3.p13.x + dsc.td3.p14.x * dsc.td3.p14.x + dsc.td3.p15.x * dsc.td3.p15.x + dsc.td3.p16.x * dsc.td3.p16.x + dsc.td3.p17.x * dsc.td3.p17.x + dsc.td3.p18.x * dsc.td3.p18.x + dsc.td3.p19.x * dsc.td3.p19.x + dsc.td3.p20.x * dsc.td3.p20.x + dsc.td3.p21.x * dsc.td3.p21.x + dsc.td3.p22.x * dsc.td3.p22.x + dsc.td3.p23.x * dsc.td3.p23.x + dsc.td3.p24.x * dsc.td3.p24.x + dsc.td3.p25.x * dsc.td3.p25.x + dsc.td3.p26.x * dsc.td3.p26.x + dsc.td3.p27.x * dsc.td3.p27.x + dsc.td3.p28.x * dsc.td3.p28.x + dsc.td3.p29.x * dsc.td3.p29.x + dsc.td3.p30.x * dsc.td3.p30.x + dsc.td3.p31.x * dsc.td3.p31.x;

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