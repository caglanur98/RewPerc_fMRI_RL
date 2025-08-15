# RewPerc_fMRI_RL — Prediction Error Signals in Reward vs Perceptual Decision‑Making

This repository contains code and scripts for a fMRI study exploring how the brain encodes prediction error signals under two distinct conditions: reward-based decision-making and perceptual decision-making. Reinforcement learning models are used to generate trial‑by‑trial prediction error estimates, which are then used in fMRI analyses.

## Overview

The study aims to determine whether neural prediction error signals are shared or distinct between tasks involving monetary rewards and those involving purely perceptual judgments. To do this, we fit reinforcement learning models to behavioural data, derive prediction error time series, and incorporate them into general linear models (GLMs) for fMRI analysis using SPM12.

## Repository Structure

- behavioral_analysis/ – scripts for importing and processing behavioural data.

- RL_scripts/ – scripts for fitting reinforcement‑learning models (Rescorla–Wagner variants), extracting prediction‑error regressors, and evaluating model fits.

- fMRI_analysis/ – SPM batch scripts and MATLAB functions for first‑level and second‑level fMRI analyses.

- condition_files/ and stimuli_list/ – files describing task conditions and experimental stimuli.

- resources/ – visual materials used in the analysis.

- *.psyexp – PsychoPy experiment files used to run the experimental tasks.
